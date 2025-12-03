namespace dvlprlife.eventsubscriberinstance1.bindsubscription;

using Microsoft.Sales.Customer;

pageextension 50130 "DVLPR Customer List Ext" extends "Customer List"
{
    actions
    {
        addfirst("&Customer")
        {
            group(DVLPRGroup)
            {
                Caption = 'My Actions';
                Image = Bank;

                action(DVLPROpenCustomerCardAction)
                {
                    ApplicationArea = All;
                    Caption = 'Open Customer Card';
                    Image = Customer;
                    ToolTip = 'Opens the Customer Card page without binding.';
                    trigger OnAction()
                    var
                        HelloWorldExampleCodeunit: Codeunit "DVLPR BindSubscription Example";
                    begin
                        HelloWorldExampleCodeunit.OpenCustomerCard(Rec);
                    end;
                }
                action(DVLPROpenCustomerCardBindingAction)
                {
                    ApplicationArea = All;
                    Caption = 'Open Customer Card with Binding';
                    Image = Customer;
                    ToolTip = 'Opens the Customer Card page with binding.';
                    trigger OnAction()
                    var
                        HelloWorldExampleCodeunit: Codeunit "DVLPR BindSubscription Example";
                    begin
                        HelloWorldExampleCodeunit.OpenCustomerCardBinding(Rec);
                    end;
                }
            }
        }
    }
}
