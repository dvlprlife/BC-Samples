namespace dvlprlife.interface1.interface1;

interface IShippingProvider
{
    procedure GetShippingRate(Length: Decimal; Width: Decimal; Height: Decimal; Weight: Decimal): Decimal
}
