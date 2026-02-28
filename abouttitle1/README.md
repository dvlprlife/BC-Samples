# abouttitle1

## Overview
This AL sample demonstrates the **AboutTitle** and **AboutText** teaching-tip properties available in Business Central. These properties attach in-app guided help tooltips that appear when a user first visits a page, helping them understand key fields, areas, and actions without leaving the screen.

## What the Sample Shows
- Adding `AboutTitle` and `AboutText` at the **page** level to introduce an entire page.
- Attaching teaching tips to **individual fields** and **actions** on a custom card and list page.
- Extending an existing base page (**Customer Card**) with teaching tips on the page itself and on the `Name` field.
- Using Markdown formatting (bold `**…**`, italic `*…*`) inside `AboutText` values.

## Solution Structure
| Object Type    | ID    | Name                     |
|----------------|-------|--------------------------|
| Table          | 50150 | DVLPR Sample Size        |
| Page           | 50151 | DVLPR Sample Size Card   |
| Page           | 50152 | DVLPR Sample Size List   |
| Page Extension | 50150 | Customer Card Tips       |

- **DVLPR Sample Size** (Table 50150) — A simple table with Code, Description, and Size fields that provides backing data for the card and list pages.
- **DVLPR Sample Size Card** (Page 50151) — A card page decorated with `AboutTitle`/`AboutText` on the page, every field, and an action, showing the full range of placement options.
- **DVLPR Sample Size List** (Page 50152) — A list page with teaching tips on the page header and repeater fields.
- **Customer Card Tips** (PageExt 50150) — Extends the standard **Customer Card** to add teaching tips at the page level and on the `Name` field.

## Prerequisites
- Microsoft Dynamics 365 Business Central application version 27.0 or later (runtime 16.0)
- VS Code with the AL Language extension
- Access to a Business Central sandbox where you can publish test extensions

## Try It Out
1. Publish the extension to your sandbox (`AL: Publish` or `F5`).
2. Open page 50152 **DVLPR Sample Size List** and create a record, then open the card.
3. Observe the teaching tips that appear on the page, fields, and actions.
4. Open the **Customer Card** to see the teaching tips added by the page extension.
5. Teaching tips typically display once per user; reset them from the **My Settings** page if you want to see them again.

## Additional Resources
- [AboutTitle Property](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/properties/devenv-abouttitle-property)
- [AboutText Property](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/properties/devenv-abouttext-property)
- [Teaching Tips and In-App Tours](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-page-teaching-tips)

**Note:** The code and information discussed in this article are for informational and demonstration purposes only. This content was created referencing Microsoft Dynamics 365 Business Central 2025 Wave 2 online.
