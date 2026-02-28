# typehelper1

## Overview
This AL sample is a comprehensive cookbook for the built-in **Type Helper** codeunit (codeunit 10, `System.Reflection` namespace) in Business Central. It organizes roughly 25 runnable examples into nine categories, each accessible from a single card page — making it easy to explore string utilities, date/time operations, encoding helpers, reflection, and more.

## What the Sample Shows
- **String Utilities** — `IsNumeric`, `IsPhoneNumber`, `IsLatinLetter`, `IsDigit`, `IsUpper`, `TextDistance` (Levenshtein distance), `CRLFSeparator`/`LFSeparator`.
- **Date and Time** — `FormatDateWithCurrentCulture`, `FormatDate` with language ID and custom format strings, `CompareDateTime`, `AddHoursToDateTime`, `GetHMSFromTime`, `EvaluateUnixTimestamp`, `GetCurrUTCDateTime`, ISO 8601 formatting.
- **Timezone Conversions** — `GetUserTimezoneOffset` to retrieve the current user's UTC offset.
- **Type Conversion and Formatting** — `Evaluate` with format strings and culture codes, `FormatDecimal`, `IntToHex`, `Maximum`/`Minimum`.
- **Web and URL Encoding** — `UrlEncode`/`UrlDecode`, `HtmlEncode`/`HtmlDecode`, `UriEscapeDataString`, `UriGetAuthority`.
- **Option Field Helpers** — `GetOptionNo`, `GetNumberOfOptions`.
- **Record and Field Reflection** — `GetField`, `GetFieldLength`, `SortRecordRef`, `GetKeyAsString` using `RecordRef`.
- **Stream Reading** — `ReadAsTextWithSeparator` via `Temp Blob` for in-memory stream manipulation.
- **Amount and Currency Formatting** — `GetAmountFormatLCYWithUserLocale`, `GetXMLAmountFormatWithTwoDecimalPlaces`, `GetXMLDateFormat`.

## Solution Structure
| Object Type | ID    | Name                            |
|-------------|-------|---------------------------------|
| Codeunit    | 50180 | DVLPR Type Helper Samples       |
| Page        | 50180 | DVLPR Type Helper Samples Card  |

- **DVLPR Type Helper Samples** (CU 50180) — Contains all sample procedures organized into `#region` blocks with XML documentation comments (`/// <summary>`). Each procedure calls one or more `Type Helper` methods and displays results via `Message()`.
- **DVLPR Type Helper Samples Card** (Page 50180) — A card page with grouped action menus matching each category. Select an action to run the corresponding sample and see its output.

## Prerequisites
- Microsoft Dynamics 365 Business Central application version 27.0 or later (runtime 16.0)
- VS Code with the AL Language extension
- Access to a Business Central sandbox where you can publish test extensions

## Try It Out
1. Publish the extension to your sandbox (`AL: Publish` or `F5`).
2. Open page 50180 **DVLPR Type Helper Samples Card**.
3. Browse the action groups (String Utilities, Date and Time, Web Encoding, etc.) and run any sample.
4. Each action displays results in a message dialog — review the codeunit source alongside to see the underlying `Type Helper` calls.

## Additional Resources
- [Type Helper Codeunit Reference](https://learn.microsoft.com/dynamics365/business-central/application/base-application/codeunit/system.reflection.type-helper)
- [RecordRef Data Type](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/methods-auto/recordref/recordref-data-type)
- [Temp Blob Codeunit](https://learn.microsoft.com/dynamics365/business-central/application/base-application/codeunit/system.utilities.temp-blob)

**Note:** The code and information discussed in this article are for informational and demonstration purposes only. This content was created referencing Microsoft Dynamics 365 Business Central 2025 Wave 2 online.
