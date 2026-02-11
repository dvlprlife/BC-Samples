namespace dvlprlife.interface1.interface1;

using Microsoft.Sales.Document;

codeunit 50165 "DVLPR Interface Management"
{
    procedure ApplyDiscount(Strategy: Enum "DVLPR Discount Strategy"; var SalesLine: Record "Sales Line")
    var
        Calculator: Interface IDiscountCalculator;
    begin
        Calculator := Strategy;
        SalesLine.Validate("Line Discount Amount", Calculator.CalculateDiscount(SalesLine));
    end;
}
