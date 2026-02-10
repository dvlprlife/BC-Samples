namespace dvlprlife.interface1.interface1;

enum 50160 "DVLPR Discount Strategy" implements IDiscountCalculator
{
    Extensible = true;

    value(0; Standard)
    {
        Implementation = IDiscountCalculator = "DVLPR Standard Discount";
    }
    value(1; Volume)
    {
        Implementation = IDiscountCalculator = "DVLPR Volume Discount";
    }
}