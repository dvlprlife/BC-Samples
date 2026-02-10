namespace dvlprlife.interface1.interface1;

using Microsoft.Sales.Document;

interface IDiscountCalculator
{
    procedure CalculateDiscount(var SalesLine: Record "Sales Line"): Decimal
}
