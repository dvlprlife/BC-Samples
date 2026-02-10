namespace dvlprlife.accessproperty1.accessproperty;

tableextension 50140 "DVLPR Access Property Ext" extends "DVLPR Access Property"
{
    fields
    {
        field(50140; "DVLPR New Local Code"; Code[10])
        {
            Caption = 'DVLPR New Local Code';
            DataClassification = CustomerContent;
        }
        field(50141; "DVLPR New Protected Code"; Code[10])
        {
            Caption = 'DVLPR New Protected Code';
            DataClassification = CustomerContent;
        }
        field(50142; "DVLPR New Internal Code"; Code[10])
        {
            Caption = 'DVLPR New Internal Code';
            DataClassification = CustomerContent;
        }
        field(50143; "DVLPR New Public Code"; Code[10])
        {
            Caption = 'DVLPR New Public Code';
            DataClassification = CustomerContent;
        }
    }

    procedure GetLocalCode(): Code[10]
    var
        RecordRef: RecordRef;
        FieldRef: FieldRef;
        LocalCode: Code[10];
    begin
        RecordRef.GetTable(Rec);
        FieldRef := RecordRef.Field(2);
        LocalCode := FieldRef.Value;
        RecordRef.Close();

        exit(LocalCode);
    end;

    procedure SetLocalCode(NewLocalCode: Code[10])
    var
        RecordRef: RecordRef;
        FieldRef: FieldRef;
    begin
        RecordRef.GetTable(Rec);
        FieldRef := RecordRef.Field(2);
        FieldRef.Value := NewLocalCode;
        RecordRef.Modify();
        RecordRef.Close();
    end;

    procedure UpdateValues(NewLocalCode: Code[10]; NewProtectedCode: Code[10]; NewPublicCode: Code[10]; NewInternalCode: Code[10])
    begin
        // Field not accessible due to its Access level
        //"Local Code" := NewLocalCode;
        "Protected Code" := NewProtectedCode;
        "Public Code" := NewPublicCode;
        "Internal Code" := NewInternalCode;
    end;
}
