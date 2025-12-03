namespace dvlprlife.eventsubscriberinstance1.bindsubscription;

using Microsoft.Sales.Customer;
codeunit 50130 "DVLPR Subscription Management"
{
    EventSubscriberInstance = Manual;

    [EventSubscriber(ObjectType::Page, Page::"Customer Card", 'OnOpenPageEvent', '', false, false)]
    local procedure OnOpenPageCustomerCard()
    begin
        Message('Hello world');
    end;
}