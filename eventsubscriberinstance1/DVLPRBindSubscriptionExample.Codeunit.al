namespace dvlprlife.eventsubscriberinstance1.bindsubscription;

using Microsoft.Sales.Customer;

codeunit 50131 "DVLPR BindSubscription Example"
{
    procedure OpenCustomerCard(Rec: Record "Customer")
    var
        CustomerCardPage: Page "Customer Card";
    begin
        CustomerCardPage.SetRecord(Rec);
        CustomerCardPage.RunModal();
    end;

    procedure OpenCustomerCardBinding(Rec: Record "Customer")
    var
        BindingExampleCodeunit: Codeunit "DVLPR Subscription Management";
        CustomerCardPage: Page "Customer Card";
    begin
        Session.BindSubscription(BindingExampleCodeunit);
        CustomerCardPage.SetRecord(Rec);
        CustomerCardPage.RunModal();
        Session.UnbindSubscription(BindingExampleCodeunit);
    end;
}
