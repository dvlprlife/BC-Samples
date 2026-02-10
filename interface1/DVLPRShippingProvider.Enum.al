namespace dvlprlife.interface1.interface1;

enum 50164 "DVLPR Shipping Provider" implements IShippingProvider
{
    Extensible = true;

    value(0; Provider1)
    {
        Implementation = IShippingProvider = "DVLPR Shipping Provider 1";
    }

    value(1; Provider2)
    {
        Implementation = IShippingProvider = "DVLPR Shipping Provider 2";
    }
}
