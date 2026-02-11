namespace dvlprlife.interface1.interface1;

using Microsoft.Pricing.Calculation;
using Microsoft.Pricing.PriceList;
codeunit 50166 "DVLPR Price Calculation" implements "Price Calculation"
{
    procedure Init(LineWithPrice: Interface Microsoft.Pricing.PriceList."Line With Price"; PriceCalculationSetup: Record "Price Calculation Setup")
    begin

    end;

    procedure GetLine(var Line: Variant)
    begin

    end;

    procedure ApplyDiscount()
    begin

    end;

    procedure ApplyPrice(CalledByFieldNo: Integer)
    begin

    end;

    procedure CountDiscount(ShowAll: Boolean): Integer
    begin

    end;

    procedure CountPrice(ShowAll: Boolean): Integer
    begin

    end;

    procedure FindDiscount(var TempPriceListLine: Record "Price List Line"; ShowAll: Boolean): Boolean
    begin

    end;

    procedure FindPrice(var TempPriceListLine: Record "Price List Line"; ShowAll: Boolean): Boolean
    begin

    end;

    procedure IsDiscountExists(ShowAll: Boolean): Boolean
    begin

    end;

    procedure IsPriceExists(ShowAll: Boolean): Boolean
    begin

    end;

    procedure PickDiscount()
    begin

    end;

    procedure PickPrice()
    begin

    end;

    procedure ShowPrices(var TempPriceListLine: Record "Price List Line")
    begin

    end;
}