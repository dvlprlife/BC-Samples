# stream1

## Overview
This AL sample demonstrates **InStream** and **OutStream** usage in Business Central — the two stream types you encounter whenever you work with BLOBs, file uploads, downloads, or web service payloads. The extension provides a card page backed by a table with a BLOB field, with grouped actions that run through the core stream patterns so you can see each one in isolation.

## What the Sample Shows
- Writing text into a `Temp Blob` using **OutStream** and reading it back with **InStream**.
- Uploading a text file with `UploadIntoStream` and reading its contents line by line using `EOS()` and `ReadText()`.
- Importing a file into a **BLOB table field** using `CopyStream` to pipe an `InStream` into an `OutStream`.
- Exporting a BLOB field back to the user with `DownloadFromStream`.
- Writing and reading multiple lines with CR/LF separators.
- Piping data between two `Temp Blob` instances using `CopyStream` without manual looping.

## Solution Structure
| Object Type | ID    | Name                        |
|-------------|-------|-----------------------------|
| Table       | 50190 | DVLPR Stream Demo           |
| Codeunit    | 50190 | DVLPR Stream Samples        |
| Page        | 50190 | DVLPR Stream Samples Card   |

- **DVLPR Stream Demo** (Table 50190) — A simple table with an auto-incrementing entry number, a description, a BLOB field for file storage, and a file name field.
- **DVLPR Stream Samples** (CU 50190) — Contains all sample procedures organized into `#region` blocks with XML documentation comments. Each procedure demonstrates a specific stream pattern and displays results via `Message()`.
- **DVLPR Stream Samples Card** (Page 50190) — A card page with grouped action menus matching each category. The BLOB Storage group exposes the record fields for the import/export demos.

## Key Concepts

| | InStream | OutStream |
|---|---|---|
| **Purpose** | Read data | Write data |
| **Text** | `ReadText()` | `WriteText()` |
| **Binary** | `Read()` | `Write()` |
| **End of stream** | `EOS()` | — |
| **Position** | `Position()`, `ResetPosition()` | — |

**In = Read. Out = Write.** Think of it from your AL code's perspective — *In* means data is coming **in** to you, *Out* means data is going **out** from you.

## Prerequisites
- Microsoft Dynamics 365 Business Central application version 27.0 or later (runtime 16.0)
- VS Code with the AL Language extension
- Access to a Business Central sandbox where you can publish test extensions

## Try It Out
1. Publish the extension to your sandbox (`AL: Publish` or `F5`).
2. Open page 50190 **Stream Samples**.
3. Run **InStream / OutStream Demo** to see text written to a TempBlob and read back.
4. Run **Import Text File** to upload a `.txt` file and view its contents line by line.
5. Create a record, then use **Import File to BLOB** to store a file in the BLOB field, and **Export BLOB to File** to download it.
6. Try **Write Multiple Lines** and **CopyStream Demo** to see the remaining patterns.

## Additional Resources
- [InStream Data Type](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/methods-auto/instream/instream-data-type)
- [OutStream Data Type](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/methods-auto/outstream/outstream-data-type)
- [Temp Blob Codeunit](https://learn.microsoft.com/dynamics365/business-central/application/base-application/codeunit/system.utilities.temp-blob)
- [UploadIntoStream Method](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/methods-auto/file/file-uploadintostream-string-string-string-text-instream-method)
- [DownloadFromStream Method](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/methods-auto/file/file-downloadfromstream-method)

**Note:** The code and information discussed in this article are for informational and demonstration purposes only. This content was created referencing Microsoft Dynamics 365 Business Central 2025 Wave 2 online.
