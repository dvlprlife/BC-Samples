namespace dvlprlife.interface1.interface1;

using Microsoft.Sales.Document;

Codeunit 50164 "DVLPR Multi Provider" implements IDiscountCalculator, IShippingProvider
{
    procedure CalculateDiscount(var SalesLine: Record "Sales Line"): Decimal
    begin
        // discount logic
    end;

    procedure GetShippingRate(Length: Decimal; Width: Decimal; Height: Decimal; Weight: Decimal): Decimal
    begin
        // shipping logic
    end;
}