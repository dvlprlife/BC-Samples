namespace dvlprlife.interface1.interface1;

codeunit 50162 "DVLPR Shipping Provider 1" implements IShippingProvider
{
    procedure GetShippingRate(Length: Decimal; Width: Decimal; Height: Decimal; Weight: Decimal): Decimal
    var
        VolumetricWeight: Decimal;
    begin
        // Simple example: base fee + weight + volumetric component
        VolumetricWeight := (Length * Width * Height) / 5000;
        exit(5 + (Weight * 1.25) + (VolumetricWeight * 0.75));
    end;
}
