namespace accessproperty.accessproperty;

pageextension 50140 "DVLPR Access Property List Ex" extends "DVLPR Access Property List"
{
    actions
    {
        addlast(Processing)
        {
            action(SetLocalCode)
            {
                Caption = 'Set Local Code';
                ApplicationArea = All;
                Image = EditLines;
                ToolTip = 'Set the Local Code field using RecordRef and FieldRef.';
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.SetLocalCode(Rec."Public Code");
                end;
            }

            action(GetLocalCode)
            {
                Caption = 'Get Local Code';
                ApplicationArea = All;
                Image = View;
                ToolTip = 'Get the Local Code field using RecordRef and FieldRef.';
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    LocalCode: Code[10];
                begin
                    LocalCode := Rec.GetLocalCode();
                    Message('Local Code is: %1', LocalCode);
                end;
            }
        }
    }
}
