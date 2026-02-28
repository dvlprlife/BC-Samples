namespace dvlprlife.samples.stream1;

table 50190 "DVLPR Stream Demo"
{
    Caption = 'Stream Demo';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Blob Field"; Blob)
        {
            Caption = 'Blob Field';
        }
        field(4; "File Name"; Text[250])
        {
            Caption = 'File Name';
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
