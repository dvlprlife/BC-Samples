namespace dvlprlife.interface1.interface1;

using Microsoft.Sales.Customer;

tableextension 50165 "DVLPR Customer" extends Customer
{
    fields
    {
        field(50160; "DVLPR Discount Strategy"; Enum "DVLPR Discount Strategy")
        {
            Caption = 'Discount Strategy';
            DataClassification = CustomerContent;
            ToolTip = 'Specifies the discount strategy to use for this customer.';
        }
        field(50161; "DVLPR Shipping Provider"; Enum "DVLPR Shipping Provider")
        {
            Caption = 'Shipping Provider';
            DataClassification = CustomerContent;
            ToolTip = 'Specifies the shipping provider to use for this customer.';
        }
    }
}
