namespace dvlprlife.interface1.interface1;

using Microsoft.Sales.Document;

Codeunit 50160 "DVLPR Standard Discount" implements IDiscountCalculator
{
    procedure CalculateDiscount(var SalesLine: Record "Sales Line"): Decimal
    begin
        exit(SalesLine."Line Amount" * 0.05); // flat 5%
    end;
}