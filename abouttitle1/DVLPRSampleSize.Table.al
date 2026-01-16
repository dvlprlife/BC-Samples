namespace dvlprlife.abouttitle1.sample;

table 50150 "DVLPR Sample Size"
{
    Caption = 'Sample Size';
    DataClassification = CustomerContent;
    DrillDownPageId = "DVLPR Sample Size List";
    LookupPageId = "DVLPR Sample Size List";

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
            ToolTip = 'Specifies the unique identifier for this sample size record.';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            ToolTip = 'Specifies a short description of what this code represents.';
        }
        field(3; Size; Integer)
        {
            Caption = 'Size';
            ToolTip = 'Specifies the numeric size value for this record.';
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
}
