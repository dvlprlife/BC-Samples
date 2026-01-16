namespace dvlprlife.abouttitle1.sample;
page 50151 "DVLPR Sample Size Card"
{
    AboutText = 'Create and maintain **sample size** records. Use Code to uniquely identify the record, Description to explain it, and Size to store a numeric value.';
    AboutTitle = 'Sample sizes';
    ApplicationArea = All;
    Caption = 'Sample Size Card';
    PageType = Card;
    SourceTable = "DVLPR Sample Size";
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(Code; Rec.Code)
                {
                    AboutText = 'A unique identifier for this sample size record.';
                    AboutTitle = 'Size code';
                }
                field(Description; Rec.Description)
                {
                    AboutText = 'A short description that explains what this code represents.';
                    AboutTitle = 'Description';
                }
                field(Size; Rec.Size)
                {
                    AboutText = 'A numeric value representing the size.';
                    AboutTitle = 'Size value';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SampleAction)
            {
                Caption = 'Sample Action';
                AboutText = 'This is a sample action that does nothing.';
                AboutTitle = 'Sample action';

                trigger OnAction()
                begin
                    // No operation
                end;
            }
        }
    }
}
