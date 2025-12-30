namespace accessproperty.accessproperty;

using dvlprlife.accessproperty1.accessproperty;

page 50140 "DVLPR Access Property List"
{
    ApplicationArea = All;
    Caption = 'DVLPR Access Property List';
    PageType = List;
    SourceTable = "DVLPR Access Property";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code") { }
                field("Internal Code"; Rec."Internal Code") { }
                // Field not accessible due to its Access level
                // field("Local Code"; Rec."Local Code")
                // {
                //     Caption = 'Local Code';
                //     ToolTip = 'Specifies the value of the Local Code field.';
                // }
                // Field not accessible due to its Access level
                // field("Protected Code"; Rec."Protected Code")
                // {
                //     Caption = 'Protected Code';
                //     ToolTip = 'Specifies the value of the Protected Code field.';
                // }
                field("Public Code"; Rec."Public Code") { }
            }
        }
    }
}
