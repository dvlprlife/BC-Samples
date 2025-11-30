namespace dvlprlife.pagebackgroundtasks1.rolecenter;

using Microsoft.Sales.Customer;
using Microsoft.Purchases.Vendor;
using Microsoft.Finance.GeneralLedger.Ledger;
using Microsoft.Sales.Receivables;
using Microsoft.Finance.GeneralLedger.Account;
using Microsoft.Inventory.Item;
using Microsoft.Inventory.Ledger;
using Microsoft.Purchases.Payables;
page 50121 "DVLPR Cue Activities"
{
    Caption = 'Background Activities';
    PageType = CardPart;
    RefreshOnActivate = true;
    ShowFilter = false;

    layout
    {
        area(content)
        {
            cuegroup(MasterRecords)
            {
                Caption = 'Master Records';
                field(CountGLAccounts; this.GLAccountCount)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'G/L Accounts';
                    ToolTip = 'Specifies the total number of general ledger account records.';
                    BlankZero = true;
                }
                field(CountCustomers; this.CustomerCount)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customers';
                    ToolTip = 'Specifies the total number of customer records.';
                    BlankZero = true;
                }
                field(CountVendors; this.VendorCount)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Vendors';
                    ToolTip = 'Specifies the total number of vendor records.';
                    BlankZero = true;
                }
                field(CountItems; this.ItemCount)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Items';
                    ToolTip = 'Specifies the total number of item records.';
                    BlankZero = true;
                }
            }
            cuegroup(Transactions)
            {
                Caption = 'Transactional Counts';
                field(CountGLEntries; this.GLEntryCount)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'GL Entries';
                    ToolTip = 'Specifies the number of general ledger entries.';
                    BlankZero = true;
                }
                field(CountCustomerLedgerEntries; this.CustomerLedgerEntryCount)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer Ledger Entries';
                    ToolTip = 'Specifies the total number of customer ledger entries.';
                    BlankZero = true;
                }
                field(CountVendorLedgerEntries; this.VendorLedgerEntryCount)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Vendor Ledger Entries';
                    ToolTip = 'Specifies the total number of vendor ledger entries.';
                    BlankZero = true;
                }
                field(CountItemLedgerEntries; this.ItemLedgerEntryCount)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Item Ledger Entries';
                    ToolTip = 'Specifies the total number of item ledger entries.';
                    BlankZero = true;
                }
                field(CountValueLedgerEntries; this.ValueEntryCount)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Value Ledger Entries';
                    ToolTip = 'Specifies the total number of value ledger entries.';
                    BlankZero = true;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        this.CountLedgerEntries();
    end;

    var
        CustomerCount: Integer;
        CustomerLedgerEntryCount: Integer;
        GLAccountCount: Integer;
        GLEntryCount: Integer;
        ItemCount: Integer;
        ItemLedgerEntryCount: Integer;
        ValueEntryCount: Integer;
        VendorCount: Integer;
        VendorLedgerEntryCount: Integer;

    local procedure CountLedgerEntries()
    var
        Parameters1,
        Parameters2,
        Parameters3,
        Parameters4,
        Parameters5,
        Parameters6,
        Parameters7,
        Parameters8,
        Parameters9 : Dictionary of [Text, Text];
        TaskId: Integer;
    begin
        Parameters1.Add('TableNo', Format(Database::Customer));
        CurrPage.EnqueueBackgroundTask(TaskId, Codeunit::"DVLPR Background Cues", Parameters1);

        Parameters2.Add('TableNo', Format(Database::"Cust. Ledger Entry"));
        CurrPage.EnqueueBackgroundTask(TaskId, Codeunit::"DVLPR Background Cues", Parameters2);

        Parameters3.Add('TableNo', Format(Database::Vendor));
        CurrPage.EnqueueBackgroundTask(TaskId, Codeunit::"DVLPR Background Cues", Parameters3);

        Parameters4.Add('TableNo', Format(Database::"Vendor Ledger Entry"));
        CurrPage.EnqueueBackgroundTask(TaskId, Codeunit::"DVLPR Background Cues", Parameters4);

        Parameters5.Add('TableNo', Format(Database::"G/L Account"));
        CurrPage.EnqueueBackgroundTask(TaskId, Codeunit::"DVLPR Background Cues", Parameters5);

        Parameters6.Add('TableNo', Format(Database::"G/L Entry"));
        CurrPage.EnqueueBackgroundTask(TaskId, Codeunit::"DVLPR Background Cues", Parameters6);

        Parameters7.Add('TableNo', Format(Database::Item));
        CurrPage.EnqueueBackgroundTask(TaskId, Codeunit::"DVLPR Background Cues", Parameters7);

        Parameters8.Add('TableNo', Format(Database::"Item Ledger Entry"));
        CurrPage.EnqueueBackgroundTask(TaskId, Codeunit::"DVLPR Background Cues", Parameters8);

        Parameters9.Add('TableNo', Format(Database::"Value Entry"));
        CurrPage.EnqueueBackgroundTask(TaskId, Codeunit::"DVLPR Background Cues", Parameters9);

    end;

    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    var
        TableNo: Integer;
    begin
        if not Evaluate(TableNo, Results.Get('TableNo')) then
            Error('TableNo result is missing or invalid');

        case TableNo of
            Database::Customer:
                if Results.ContainsKey('Count') then
                    Evaluate(this.CustomerCount, Results.Get('Count'));
            Database::"Cust. Ledger Entry":
                if Results.ContainsKey('Count') then
                    Evaluate(this.CustomerLedgerEntryCount, Results.Get('Count'));
            Database::Vendor:
                if Results.ContainsKey('Count') then
                    Evaluate(this.VendorCount, Results.Get('Count'));
            Database::"Vendor Ledger Entry":
                if Results.ContainsKey('Count') then
                    Evaluate(this.VendorLedgerEntryCount, Results.Get('Count'));
            Database::"G/L Account":
                if Results.ContainsKey('Count') then
                    Evaluate(this.GLAccountCount, Results.Get('Count'));
            Database::"G/L Entry":
                if Results.ContainsKey('Count') then
                    Evaluate(this.GLEntryCount, Results.Get('Count'));
            Database::Item:
                if Results.ContainsKey('Count') then
                    Evaluate(this.ItemCount, Results.Get('Count'));
            Database::"Item Ledger Entry":
                if Results.ContainsKey('Count') then
                    Evaluate(this.ItemLedgerEntryCount, Results.Get('Count'));
            Database::"Value Entry":
                if Results.ContainsKey('Count') then
                    Evaluate(this.ValueEntryCount, Results.Get('Count'));
        end;
    end;

    trigger OnPageBackgroundTaskError(TaskId: Integer; ErrorCode: Text; ErrorText: Text; ErrorCallStack: Text; var IsHandled: Boolean)
    begin
        // Handle errors here
    end;
}
