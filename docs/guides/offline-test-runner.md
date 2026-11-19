---
title: "Offline Test Runner"
description: "Execute built-in test suites without network or Google API credentials."
order: 15
---
# Offline Test Runner

CalGrid includes a built-in **Offline Test Runner** that validates the application's internal logic without making any live Google API calls.

---

## Purpose

The Offline Test Runner is a diagnostic tool for verifying that CalGrid's core engine is working correctly on your Windows PC. It is primarily useful for:

- Verifying that the installation is correct after setup
- Diagnosing environment-specific issues
- Running regression checks after system changes

> **Note:** The Offline Test Runner does not send any real invitations. All tests use mock data and simulated API responses.

---

## Accessing the Test Runner

1. Click **⚡ Debug** in the bottom status bar.
2. In the Debug dialog, click **Offline Tests**.

A separate window opens with the test runner interface.

---

## Test Runner Options

| Option | Description |
|---|---|
| **Offline Checks** | Runs Phase-01 through Phase-04 mocks and Windows UI checks (the standard quick check) |
| **Full Regression** | Runs the complete test suite including tests with known legacy failures |

---

## Running Tests

1. Select **Offline Checks** or **Full Regression**.
2. Click **Run Tests**.
3. The output panel shows test results as they execute.
4. Summary counters show Pass / Fail / Error counts.
5. When complete, the subprocess exit status is displayed.

### Controls During Test Run

| Button | Action |
|---|---|
| **Stop** | Terminate the running test process |
| **Copy Summary** | Copy the test result summary to clipboard |

---

## Test Result Storage

The last sanitized test result is saved to `notes/offline_test_last_result.json` (a Git-ignored local file) for reference. This file is for local review only and does not leave your machine.

---

## Interpreting Results

- A result of **20/20 pass** (Offline Checks) indicates the core engine is healthy.
- Failures in the Full Regression suite may include pre-existing legacy test contract issues that do not affect actual application functionality.
- Production readiness assessment requires live Google API testing with a consented test account — the Offline Test Runner alone does not certify the application for production use.

---

## Related Pages

- [Debug Dialog](debug-dialog.md)
- [Troubleshooting](../help/troubleshooting.md)
