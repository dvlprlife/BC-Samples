namespace dvlprlife.interface1.interface1;

codeunit 50163 "DVLPR Shipping Provider 2" implements IShippingProvider
{
    procedure GetShippingRate(Length: Decimal; Width: Decimal; Height: Decimal; Weight: Decimal): Decimal
    var
        Girth: Decimal;
    begin
        // Simple example: rate biased toward size and heavier parcels
        Girth := (2 * Width) + (2 * Height);
        exit(3 + (Weight * 1.75) + ((Length + Girth) * 0.05));
    end;
}
