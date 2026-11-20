# CalGrid Windows x64 installer — powered by get.vib.tools
# Edge-injected variables: $APP_SLUG, $APP_VERSION, $APP_NAME
# Fallback values are used only when running this script directly without edge injection.
# Windows PowerShell 5.1 / PowerShell 7.x. No administrator privileges required.
Set-StrictMode -Version 2.0
$ErrorActionPreference = 'Stop'

# Edge-injected by get.vib.tools at download time:
if (-not (Get-Variable -Name APP_VERSION -Scope Script -ErrorAction SilentlyContinue)) {
    $APP_VERSION = '1.0.4'
}
if (-not (Get-Variable -Name APP_SLUG -Scope Script -ErrorAction SilentlyContinue)) {
    $APP_SLUG = 'calgrid'
}
if (-not (Get-Variable -Name APP_NAME -Scope Script -ErrorAction SilentlyContinue)) {
    $APP_NAME = 'CalGrid'
}

$ReleaseFolder = $APP_NAME + '-v' + $APP_VERSION + '-win-x64'
$ReleaseZip    = $ReleaseFolder + '.zip'
$ReleaseUrl    = 'https://dl.vib.tools/' + $APP_NAME + '/v' + $APP_VERSION + '/' + $ReleaseZip

function Test-CalGridArchive {
    param([string]$ZipPath, [string]$RootName, [long]$ZipBytes)
    if ((Get-Item -LiteralPath $ZipPath).Length -ne $ZipBytes) { throw 'Release ZIP file size mismatch.' }
    Add-Type -AssemblyName System.IO.Compression -ErrorAction Stop
    Add-Type -AssemblyName System.IO.Compression.FileSystem -ErrorAction Stop
    $archive = [System.IO.Compression.ZipFile]::OpenRead($ZipPath)
    try {
        $seen   = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
        $hasExe = $false
        [long]$sum  = 0
        [int]$count = 0
        foreach ($e in $archive.Entries) {
            $count++
            if ($count -gt 10000) { throw 'Unsafe number of ZIP entries.' }
            $n = $e.FullName
            if ([string]::IsNullOrWhiteSpace($n) -or $n.StartsWith('/') -or
                $n.Contains('\') -or $n.Contains(':') -or $n -match '[\x00-\x1F]') {
                throw 'Unsafe ZIP entry path.'
            }
            $part     = $n.TrimEnd([char]'/')
            $segments = $part.Split([char]'/')
            if ($segments[0] -cne $RootName) { throw 'Incorrect release folder in ZIP.' }
            if ($segments.Length -eq 1 -and -not $n.EndsWith('/')) {
                throw 'Unexpected top-level ZIP file.'
            }
            foreach ($segment in $segments) {
                if ([string]::IsNullOrWhiteSpace($segment) -or $segment -eq '.' -or
                    $segment -eq '..' -or $segment.EndsWith('.') -or $segment.EndsWith(' ')) {
                    throw 'ZIP traversal or ambiguous path detected.'
                }
            }
            if (-not $seen.Add($part)) { throw 'Duplicate ZIP entry path.' }
            $unixMode = ([int]($e.ExternalAttributes -shr 16) -band 0xF000)
            if ($unixMode -eq 0xA000) { throw 'ZIP symlink not permitted.' }
            if (-not $n.EndsWith('/')) {
                $sum += [long]$e.Length
                if ($sum -gt 4294967296) { throw 'ZIP expanded size exceeds limit.' }
                if ($n -ceq ($RootName + '/' + $APP_NAME + '.exe')) { $hasExe = $true }
            }
        }
        if ($count -lt 2 -or -not $hasExe) {
            throw 'Release ZIP does not contain the expected application executable.'
        }
    } finally { $archive.Dispose() }
}

function Receive-AppZip {
    param([uri]$Uri, [string]$Destination, [long]$ExpectedBytes, [System.Net.Http.HttpClient]$Http)
    $req    = [System.Net.Http.HttpRequestMessage]::new([System.Net.Http.HttpMethod]::Get, $Uri)
    $req.Headers.UserAgent.ParseAdd($APP_NAME + '-Installer/1.0')
    $cancel = [System.Threading.CancellationTokenSource]::new()
    $cancel.CancelAfter([TimeSpan]::FromMinutes(30))
    $response = $null; $incoming = $null; $outgoing = $null
    try {
        $response = $Http.SendAsync($req, [System.Net.Http.HttpCompletionOption]::ResponseHeadersRead, $cancel.Token).GetAwaiter().GetResult()
        if ([int]$response.StatusCode -ne 200) { throw ('Download failed: HTTP ' + [int]$response.StatusCode) }
        if ($response.Content.Headers.ContentLength -ne $ExpectedBytes) {
            throw 'Download Content-Length is not the expected ZIP size.'
        }
        if ($response.Content.Headers.ContentType -and
            $response.Content.Headers.ContentType.MediaType -notin @('application/zip','application/octet-stream')) {
            throw 'Unexpected HTTP download content type.'
        }
        $incoming = $response.Content.ReadAsStreamAsync().GetAwaiter().GetResult()
        $outgoing = [IO.File]::Open($Destination, [IO.FileMode]::CreateNew, [IO.FileAccess]::Write, [IO.FileShare]::None)
        $buf = New-Object byte[] 131072
        [long]$total = 0; [long]$reported = 0
        while ($true) {
            $n = $incoming.ReadAsync($buf, 0, $buf.Length, $cancel.Token).GetAwaiter().GetResult()
            if ($n -eq 0) { break }
            $total += $n
            if ($total -gt $ExpectedBytes) { throw 'Downloaded data exceeded expected ZIP size.' }
            $outgoing.Write($buf, 0, $n)
            if (($total - $reported) -ge 20971520) {
                Write-Host ('Downloaded ' + [math]::Floor($total / 1048576) + ' MiB...')
                $reported = $total
            }
        }
        $outgoing.Flush()
        if ($total -ne $ExpectedBytes) { throw 'Downloaded ZIP incomplete.' }
    } finally {
        if ($outgoing)  { $outgoing.Dispose() }
        if ($incoming)  { $incoming.Dispose() }
        if ($response)  { $response.Dispose() }
        $req.Dispose(); $cancel.Dispose()
    }
}

function Install-CalGridRelease {
    $client = $null; $handler = $null; $zipTemp = $null
    $stage  = $null; $lock    = $null; $lockPath = $null
    try {
        if ([Environment]::OSVersion.Platform -ne [PlatformID]::Win32NT -or
            -not [Environment]::Is64BitOperatingSystem) {
            throw ('This release of ' + $APP_NAME + ' requires Windows x64.')
        }
        if ($PSVersionTable.PSVersion.Major -lt 5) { throw 'PowerShell 5.1 or newer required.' }
        $desktop = [Environment]::GetFolderPath('Desktop')
        if (-not [IO.Directory]::Exists($desktop)) { throw 'Current user Desktop not found.' }
        $root = Join-Path $desktop $APP_NAME
        if (Test-Path -LiteralPath $root -PathType Leaf) { throw ('Desktop contains a file named ' + $APP_NAME + '.') }
        if (-not (Test-Path -LiteralPath $root)) { [void][IO.Directory]::CreateDirectory($root) }
        if (((Get-Item -LiteralPath $root).Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) {
            throw ($APP_NAME + ' folder is a filesystem link; refusing installation.')
        }
        $target = Join-Path $root $ReleaseFolder
        if (Test-Path -LiteralPath $target) {
            throw ($APP_NAME + ' v' + $APP_VERSION + ' already installed. No existing files changed.')
        }
        $lockPath = Join-Path $root ('.' + $APP_SLUG + '-installer.lock')
        $lock     = [IO.File]::Open($lockPath,[IO.FileMode]::OpenOrCreate,[IO.FileAccess]::ReadWrite,[IO.FileShare]::None)
        if (Test-Path -LiteralPath $target) { throw 'Concurrent installation detected.' }
        $nonce   = [Guid]::NewGuid().ToString('N')
        $zipTemp = Join-Path $root ('.' + $APP_SLUG + '-download-' + $nonce + '.zip')
        $stage   = Join-Path $root ('.' + $APP_SLUG + '-stage-' + $nonce)
        $url     = [uri]$ReleaseUrl
        if ($url.Scheme -cne 'https' -or $url.Host -cne 'dl.vib.tools') {
            throw 'Unexpected download origin. HTTPS-only installer.'
        }
        # Resolve Content-Length from HEAD to verify ZIP size before download
        Add-Type -AssemblyName System.Net.Http -ErrorAction Stop
        $handler = [System.Net.Http.HttpClientHandler]::new()
        $handler.AllowAutoRedirect = $false
        $handler.AutomaticDecompression = [Net.DecompressionMethods]::None
        $client  = [System.Net.Http.HttpClient]::new($handler)
        $client.Timeout = [TimeSpan]::FromMinutes(30)
        if ($PSVersionTable.PSEdition -eq 'Desktop') {
            [Net.ServicePointManager]::SecurityProtocol =
                [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
        }
        # Fetch Content-Length via HEAD
        $headReq = [System.Net.Http.HttpRequestMessage]::new([System.Net.Http.HttpMethod]::Head, $url)
        $headReq.Headers.UserAgent.ParseAdd($APP_NAME + '-Installer/1.0')
        $headResp = $client.SendAsync($headReq).GetAwaiter().GetResult()
        [long]$expectedBytes = $headResp.Content.Headers.ContentLength
        $headResp.Dispose(); $headReq.Dispose()
        if ($expectedBytes -le 0) { throw 'Could not determine ZIP size from server. Aborting.' }
        $drive = [IO.DriveInfo]::new([IO.Path]::GetPathRoot($root))
        if ($drive.AvailableFreeSpace -lt ($expectedBytes * 3 + 134217728)) {
            throw 'Not enough free disk space to install ' + $APP_NAME + '.'
        }
        Write-Host ($APP_NAME + ' v' + $APP_VERSION + ': downloading ' + [math]::Round($expectedBytes/1MB, 1) + ' MB...')
        Receive-AppZip -Uri $url -Destination $zipTemp -ExpectedBytes $expectedBytes -Http $client
        Test-CalGridArchive -ZipPath $zipTemp -RootName $ReleaseFolder -ZipBytes $expectedBytes
        Write-Host 'Archive structure verified.'
        [void][IO.Directory]::CreateDirectory($stage)
        [System.IO.Compression.ZipFile]::ExtractToDirectory($zipTemp,$stage)
        $extracted = Join-Path $stage $ReleaseFolder
        if (-not (Test-Path -LiteralPath (Join-Path $extracted ($APP_NAME + '.exe')) -PathType Leaf)) {
            throw ($APP_NAME + '.exe not found after ZIP extraction.')
        }
        if (Test-Path -LiteralPath $target) { throw 'Another installation created the target. Stopped.' }
        [IO.Directory]::Move($extracted,$target)
        Write-Host ('Installed successfully: ' + $target)
        if ($lock) { $lock.Dispose(); $lock = $null }
        if ($lockPath) { Remove-Item -LiteralPath $lockPath -Force -ErrorAction SilentlyContinue; $lockPath=$null }
        Start-Process -FilePath (Join-Path $target ($APP_NAME + '.exe')) -WorkingDirectory $target -ErrorAction Stop
        Write-Host ($APP_NAME + ' opened. Enter your license key in the app.')
    } finally {
        if ($client)  { $client.Dispose() }
        if ($handler) { $handler.Dispose() }
        if ($lock)    { $lock.Dispose() }
        if ($zipTemp -and (Test-Path -LiteralPath $zipTemp)) {
            Remove-Item -LiteralPath $zipTemp -Force -ErrorAction SilentlyContinue
        }
        if ($stage -and (Test-Path -LiteralPath $stage)) {
            Remove-Item -LiteralPath $stage -Recurse -Force -ErrorAction SilentlyContinue
        }
        if ($lockPath -and (Test-Path -LiteralPath $lockPath)) {
            Remove-Item -LiteralPath $lockPath -Force -ErrorAction SilentlyContinue
        }
    }
}

# Dot-source for isolated offline helper-function tests without installing.
if ($MyInvocation.InvocationName -ne '.') {
    try { Install-CalGridRelease } catch {
        Write-Host ($APP_NAME + ' installation stopped: ' + $_.Exception.Message) -ForegroundColor Red
        exit 1
    }
}
