namespace dvlprlife.interface1.interface1;

using Microsoft.Sales.Customer;

pageextension 50165 "DVLPR Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("DVLPR Discount Strategy"; Rec."DVLPR Discount Strategy")
            {
                ApplicationArea = All;
                Caption = 'Discount Strategy';
                ToolTip = 'Specifies the discount strategy to use for this customer.';
            }
            field("DVLPR Shipping Provider"; Rec."DVLPR Shipping Provider")
            {
                ApplicationArea = All;
                Caption = 'Shipping Provider';
                ToolTip = 'Specifies the shipping provider to use for this customer.';
            }
        }
    }
}
