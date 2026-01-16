namespace dvlprlife.abouttitle1.sample;

page 50152 "DVLPR Sample Size List"
{
    AboutText = 'Browse all **sample size** records. Open a line to view or edit details on the card page.';
    AboutTitle = 'Sample sizes';
    ApplicationArea = All;
    Caption = 'Sample Size List';
    CardPageId = "DVLPR Sample Size Card";
    PageType = List;
    SourceTable = "DVLPR Sample Size";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
}
