namespace dvlprlife.interface1.interface1;

using Microsoft.Sales.Document;

Codeunit 50161 "DVLPR Volume Discount" implements IDiscountCalculator
{
    procedure CalculateDiscount(var SalesLine: Record "Sales Line"): Decimal
    begin
        if SalesLine.Quantity >= 100 then
            exit(SalesLine."Line Amount" * 0.15)
        else
            exit(SalesLine."Line Amount" * 0.05);
    end;
}