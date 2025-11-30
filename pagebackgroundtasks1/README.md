# pagebackgroundtasks1

## Overview
This sample Business Central extension shows how to populate Role Center cues by offloading heavy data aggregation to page background tasks. The solution ships a custom Role Center (`DVLPR Background Role Center`) that hosts a cue part (`DVLPR Cue Activities`) and a supporting codeunit (`DVLPR Background Cues`) responsible for counting records asynchronously.

## Key Features
- Demonstrates the `CurrPage.EnqueueBackgroundTask` API to run lightweight background computations per cue.
- Splits cues into **Master Records** (Customers, Vendors, Items, G/L Accounts) and **Transactional Counts** (ledger entry totals).
- Uses `Dictionary` arguments to pass parameters between the page and the background task codeunit.
- Shows how to handle the `OnPageBackgroundTaskCompleted` and `OnPageBackgroundTaskError` triggers for result processing and error handling.

## Object Inventory
| Object Type | ID    | Name                        |
|-------------|-------|-----------------------------|
| Page        | 50120 | DVLPR Background Role Center |
| Page        | 50121 | DVLPR Cue Activities         |
| Codeunit    | 50120 | DVLPR Background Cues        |

## Prerequisites
- Business Central 2025 release wave 2 (application version 27.0.0.0) or later, matching the dependency set in `app.json`.
- AL Language extension for Visual Studio Code.

## Build & Deploy
1. Open the workspace folder in VS Code.
2. Ensure the correct Business Central server details exist in `.vscode/launch.json` (not included in this sample).
3. Run **AL: Download Symbols** to pull platform/application symbols if needed.
4. Publish the extension with **AL: Publish without debugging** (or your preferred task).

## Using the Sample
1. Assign the `DVLPR Background Role Center` to a test user profile.
2. Open the Role Center to load the cue part.
3. The page enqueues background tasks for each cue; counts refresh as tasks complete.

## Notes
- Background task errors currently surface in the page error trigger; extend `OnPageBackgroundTaskError` if you need custom logging or user messaging.

**Note:** The code and information discussed in this article are for informational and demonstration purposes only. This content was created referencing Microsoft Dynamics 365 Business Central 2025 Wave 2 online.