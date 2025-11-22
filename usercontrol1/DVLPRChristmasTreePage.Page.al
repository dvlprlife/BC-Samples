namespace dvlprlife.usercontrol1.ChristmasTree;

page 50100 "DVLPR Christmas Tree Page"
{
    ApplicationArea = All;
    Caption = 'Christmas Tree';
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            group(controls)
            {
                Caption = 'Merry Christmas!';
                usercontrol(PageControlAddIn; DVLPRControlAddIn)
                {
                    trigger OnControlAddInReady()
                    begin
                        CurrPage.PageControlAddIn.Render('<div id="scrolltext">Merry Christmas!</div>');
                        CurrPage.PageControlAddIn.Animate();
                    end;

                    trigger ShowError(ErrorTxt: Text)
                    begin
                        Error(ErrorTxt);
                    end;
                }
            }
        }
    }
}
