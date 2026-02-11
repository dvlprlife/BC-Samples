namespace dvlprlife.interface1.interface1;

using Microsoft.Sales.Customer;
using Microsoft.Sales.Document;

pageextension 50166 "DVLPR Sales Order Subform" extends "Sales Order Subform"
{
    actions
    {
        addlast(processing)
        {
            action("DVLPR Apply Discount")
            {
                ApplicationArea = All;
                Caption = 'Apply Discount';
                Image = LineDiscount;
                ToolTip = 'Applies the discount strategy defined on the bill-to customer to the selected sales line.';

                trigger OnAction()
                var
                    Customer: Record Customer;
                    SalesLine: Record "Sales Line";
                    InterfaceMgt: Codeunit "DVLPR Interface Management";
                    ConfirmMsg: Label 'Do you want to apply the discount to this line?';
                begin
                    if not Confirm(ConfirmMsg) then
                        exit;

                    SalesLine := Rec;
                    Customer.Get(SalesLine."Bill-to Customer No.");
                    InterfaceMgt.ApplyDiscount(Customer."DVLPR Discount Strategy", SalesLine);
                    Rec := SalesLine;
                    Rec.Modify(true);
                end;
            }
        }
    }
}
