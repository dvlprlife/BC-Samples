# sessionlogmessage1

## Overview
This AL sample demonstrates the **Session.LogMessage** method for emitting custom telemetry events to Application Insights, combined with a simple **HttpClient** call to an external REST API. The extension provides a card page where you can fire an API request and observe how success and failure events are logged with custom dimensions.

## What the Sample Shows
- Calling `Session.LogMessage` with custom event IDs, verbosity levels, and telemetry scopes.
- Building a `Dictionary of [Text, Text]` to attach custom dimensions (endpoint, HTTP status code, success flag) to telemetry events.
- Using `TelemetryScope::ExtensionPublisher` for normal events and `TelemetryScope::All` for error events.
- Making an external HTTP GET request with `HttpClient` and `HttpResponseMessage`.
- Configuring `applicationInsightsConnectionString` in `app.json` to route telemetry to your Application Insights resource.
- Conditional field styling with `StyleExpr` to visually indicate success or failure.

## Solution Structure
| Object Type | ID    | Name                          |
|-------------|-------|-------------------------------|
| Codeunit    | 50170 | DVLPR Session Log Message     |
| Page        | 50170 | DVLPR Test API Call Card      |

- **DVLPR Session Log Message** (CU 50170) — Contains the `CallExternalApi` procedure that performs the HTTP call, builds a custom dimensions dictionary, and calls `LogMessage` with event ID `'DVLPR-1001'` on success or `'DVLPR-1002'` on failure.
- **DVLPR Test API Call Card** (Page 50170) — A card page with an Endpoint URL field (defaults to `https://jsonplaceholder.typicode.com/posts/1`) and a **Call External API** action. Displays the result with green/red styling based on success.

## Prerequisites
- Microsoft Dynamics 365 Business Central application version 27.0 or later (runtime 16.0)
- VS Code with the AL Language extension
- Access to a Business Central sandbox where you can publish test extensions
- An Application Insights resource (optional — telemetry events are emitted regardless, but you need App Insights to view them)

## Try It Out
1. Publish the extension to your sandbox (`AL: Publish` or `F5`).
2. Open page 50170 **DVLPR Test API Call Card**.
3. Leave the default endpoint or enter your own URL, then run the **Call External API** action.
4. Observe the success or failure result on the page.
5. If you have Application Insights configured, query the `traces` or `customEvents` table to find events with IDs `DVLPR-1001` (success) and `DVLPR-1002` (failure) along with their custom dimensions.

## Additional Resources
- [Session.LogMessage Method](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/methods-auto/session/session-logmessage-string-string-verbosity-dataclassification-telemetryscope-dictionary%5Btext,text%5D-method)
- [Sending Custom Telemetry](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-instrument-application-for-telemetry)
- [HttpClient Data Type](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/methods-auto/httpclient/httpclient-data-type)

**Note:** The code and information discussed in this article are for informational and demonstration purposes only. This content was created referencing Microsoft Dynamics 365 Business Central 2025 Wave 2 online.
