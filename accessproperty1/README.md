# accessproperty1

## Overview
This AL sample demonstrates the field-level **Access** property on table fields and the visibility rules each level imposes on table extensions and pages. The extension walks through `Local`, `Protected`, `Public`, and `Internal` access modifiers and shows a practical `RecordRef`/`FieldRef` workaround for reaching fields that are otherwise inaccessible.

## What the Sample Shows
- Declaring table fields with `Access = Local`, `Access = Protected`, `Access = Public`, and `Access = Internal`.
- Which access levels a **table extension** can reference directly and which it cannot.
- Which access levels a **page** can reference directly.
- Using `RecordRef` and `FieldRef` reflection to read and write `Local` fields from outside the table object.

## Solution Structure
| Object Type     | ID    | Name                            |
|-----------------|-------|---------------------------------|
| Table           | 50140 | DVLPR Access Property           |
| Table Extension | 50140 | DVLPR Access Property Ext       |
| Page            | 50140 | DVLPR Access Property List      |
| Page Extension  | 50140 | DVLPR Access Property List Ex   |

- **DVLPR Access Property** (Table 50140) — Defines five fields, each with a different `Access` level, plus a `SetValues` procedure that writes to all fields from within the table.
- **DVLPR Access Property Ext** (TableExt 50140) — Extends the same table, demonstrating that `Local` fields cannot be referenced directly (commented out with notes) while `Protected` fields can. Includes `SetLocalCode` and `GetLocalCode` procedures that use `RecordRef`/`FieldRef` to bypass the restriction.
- **DVLPR Access Property List** (Page 50140) — A list page displaying only the fields that a page can access; `Local` and `Protected` fields are commented out with explanations.
- **DVLPR Access Property List Ex** (PageExt 50140) — Adds promoted actions for **Set Local Code** and **Get Local Code** that invoke the `RecordRef`-based workaround procedures from the table extension.

## Prerequisites
- Microsoft Dynamics 365 Business Central application version 27.0 or later (runtime 16.0)
- VS Code with the AL Language extension
- Access to a Business Central sandbox where you can publish test extensions

## Try It Out
1. Publish the extension to your sandbox (`AL: Publish` or `F5`).
2. Open page 50140 **DVLPR Access Property List**.
3. Use the **Set Local Code** action to write a value to the `Local` field via `RecordRef`.
4. Use the **Get Local Code** action to read that value back, confirming the workaround.
5. Review the commented-out lines in the source to understand which access levels block direct references from extensions and pages.

## Additional Resources
- [Access Property](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/properties/devenv-access-property)
- [RecordRef Data Type](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/methods-auto/recordref/recordref-data-type)
- [FieldRef Data Type](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/methods-auto/fieldref/fieldref-data-type)

**Note:** The code and information discussed in this article are for informational and demonstration purposes only. This content was created referencing Microsoft Dynamics 365 Business Central 2025 Wave 2 online.
