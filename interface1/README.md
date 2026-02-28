# interface1

## Overview
This AL sample demonstrates the **interface pattern** in Business Central — defining contracts through `interface` objects, mapping implementations to enum values with the `implements` keyword, and calling them polymorphically at runtime. The extension covers two independent interface scenarios (discount calculation and shipping rates), a codeunit that implements multiple interfaces simultaneously, and a stub implementation of the built-in `"Price Calculation"` system interface.

## What the Sample Shows
- Declaring `interface` objects with method signatures that act as contracts.
- Creating an `enum` that `implements` an interface, with each value mapped to a different codeunit.
- Polymorphic dispatch — assigning an enum to an interface variable and calling the interface method.
- A single codeunit implementing **multiple** interfaces at once.
- Implementing a built-in Business Central system interface (`"Price Calculation"`).
- Extending the **Customer** table and **Customer Card** to store a per-customer strategy selection.
- Adding an **Apply Discount** action to the **Sales Order Subform** that applies the selected strategy to the current line.

## Solution Structure
| Object Type     | ID    | Name                          |
|-----------------|-------|-------------------------------|
| Interface       | —     | IDiscountCalculator           |
| Interface       | —     | IShippingProvider             |
| Enum            | 50160 | DVLPR Discount Strategy       |
| Enum            | 50164 | DVLPR Shipping Provider       |
| Codeunit        | 50160 | DVLPR Standard Discount       |
| Codeunit        | 50161 | DVLPR Volume Discount         |
| Codeunit        | 50162 | DVLPR Shipping Provider 1     |
| Codeunit        | 50163 | DVLPR Shipping Provider 2     |
| Codeunit        | 50164 | DVLPR Multi Provider          |
| Codeunit        | 50165 | DVLPR Interface Management    |
| Codeunit        | 50166 | DVLPR Price Calculation       |
| Table Extension | 50165 | DVLPR Customer                |
| Page Extension  | 50165 | DVLPR Customer Card           |
| Page Extension  | 50166 | DVLPR Sales Order Subform     |

### Key Objects
- **IDiscountCalculator / IShippingProvider** — Interface declarations defining the `CalculateDiscount` and `GetShippingRate` method signatures.
- **DVLPR Standard Discount** (CU 50160) — Returns a flat 5% discount.
- **DVLPR Volume Discount** (CU 50161) — Returns 15% for quantities of 100 or more, otherwise 5%.
- **DVLPR Multi Provider** (CU 50164) — Implements both `IDiscountCalculator` and `IShippingProvider` in a single codeunit.
- **DVLPR Interface Management** (CU 50165) — Receives an enum value, casts it to the `IDiscountCalculator` interface, and invokes `CalculateDiscount` polymorphically.
- **DVLPR Price Calculation** (CU 50166) — A stub implementing the built-in `"Price Calculation"` interface, showing how to create a custom pricing engine.

## Prerequisites
- Microsoft Dynamics 365 Business Central application version 27.0 or later (runtime 16.0)
- VS Code with the AL Language extension
- Access to a Business Central sandbox where you can publish test extensions

## Try It Out
1. Publish the extension to your sandbox (`AL: Publish` or `F5`).
2. Open the **Customer Card** for any customer and set a **Discount Strategy** (Standard, Volume, or MultiProvider) and a **Shipping Provider**.
3. Create a **Sales Order** for that customer.
4. On the sales order lines, run the **Apply Discount** action to see the selected strategy calculate and apply a discount to the current line.
5. Review the source to see how the enum-to-interface dispatch works — no `case` statements needed.

## Extending the Sample
- Add a new enum value and codeunit to introduce a "Loyalty" or "Seasonal" discount strategy without modifying existing code.
- Wire the shipping provider interface into a shipping charge calculation on the sales order.
- Replace the stub `DVLPR Price Calculation` codeunit with real pricing logic to see how custom pricing engines integrate with the BC pricing framework.

## Additional Resources
- [Interfaces in AL](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-interfaces-in-al)
- [Implements Keyword](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-implements-keyword)
- [Enum Data Type](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/methods-auto/enum/enum-data-type)

**Note:** The code and information discussed in this article are for informational and demonstration purposes only. This content was created referencing Microsoft Dynamics 365 Business Central 2025 Wave 2 online.
