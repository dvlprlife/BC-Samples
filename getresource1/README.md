# getresource1

## Overview
This AL sample demonstrates the **NavApp resource** methods for reading files that are bundled inside the app package at compile time. The extension loads JSON, plain-text, and image resources at runtime and enumerates the contents of the resource folder — all from a single card page.

## What the Sample Shows
- Configuring `resourceFolders` in `app.json` so the compiler includes a `resources` directory in the published app.
- Loading a JSON file with `NavApp.GetResourceAsJson()`.
- Loading a text file with `NavApp.GetResourceAsText()` using `TextEncoding::UTF8`.
- Listing all bundled resources with `NavApp.ListResources('')` and filtering by subfolder with `NavApp.ListResources('images')`.

## Solution Structure
| Object Type | ID    | Name                      |
|-------------|-------|---------------------------|
| Page        | 50122 | DVLPR GetResource Files   |

- **DVLPR GetResource Files** (Page 50122) — A card page that runs all four resource operations in `OnOpenPage` and displays the results in read-only text fields.
- **resources/** — Contains sample files loaded at runtime:
  - `json/items.json` — A JSON document read as a `JsonObject`.
  - `text/sample.txt` — A plain-text file read as `Text`.
  - `images/` — Image files enumerated by `ListResources`.

## Prerequisites
- Microsoft Dynamics 365 Business Central application version 27.0 or later (runtime 16.0)
- VS Code with the AL Language extension
- Access to a Business Central sandbox where you can publish test extensions

## Try It Out
1. Publish the extension to your sandbox (`AL: Publish` or `F5`).
2. Open page 50122 **DVLPR GetResource Files**.
3. The page loads automatically on open — observe the JSON content, text content, and resource listings displayed on screen.

## Additional Resources
- [NavApp.GetResourceAsJson Method](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/methods-auto/navapp/navapp-getresourceasjson-method)
- [NavApp.GetResourceAsText Method](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/methods-auto/navapp/navapp-getresourceastext-method)
- [NavApp.ListResources Method](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/methods-auto/navapp/navapp-listresources-method)
- [Resource Folders in app.json](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-json-files#appjson-file)

**Note:** The code and information discussed in this article are for informational and demonstration purposes only. This content was created referencing Microsoft Dynamics 365 Business Central 2025 Wave 2 online.
