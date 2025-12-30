namespace dvlprlife.accessproperty1.accessproperty;

table 50140 "DVLPR Access Property"
{
    Access = Public;
    Caption = 'DVLPR';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            ToolTip = 'Specifies the value of the Code field.';
        }
        field(2; "Local Code"; Code[10])
        {
            Access = Local;
            Caption = 'Local Code';
            ToolTip = 'Specifies the value of the Local Code field.';
        }
        field(3; "Protected Code"; Code[10])
        {
            Access = Protected;
            Caption = 'Protected Code';
            ToolTip = 'Specifies the value of the Protected Code field.';
        }
        field(4; "Public Code"; Code[10])
        {
            Access = Public;
            Caption = 'Public Code';
            ToolTip = 'Specifies the value of the Public Code field.';
        }
        field(5; "Internal Code"; Code[10])
        {
            Access = Internal;
            Caption = 'Internal Code';
            ToolTip = 'Specifies the value of the Internal Code field.';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }

    procedure SetValues(NewLocalCode: Code[10]; NewProtectedCode: Code[10]; NewPublicCode: Code[10]; NewInternalCode: Code[10])
    begin
        "Local Code" := NewLocalCode;
        "Protected Code" := NewProtectedCode;
        "Public Code" := NewPublicCode;
        "Internal Code" := NewInternalCode;
    end;
}
