namespace dvlprlife.usercontrol2.PopGame;

page 50110 "DVLPR Pop Game Page"
{
    ApplicationArea = All;
    Caption = 'Pop Game';
    UsageCategory = Lists;
    PageType = UserControlHost;

    layout
    {
        area(Content)
        {
            usercontrol(PageControlAddIn; DVLPRPopGameControlAddIn)
            {
                trigger OnControlAddInReady()
                begin
                    Message('Control Add-In is ready. Rendering game UI...');
                end;

                trigger ShowError(ErrorTxt: Text)
                begin
                    Error(ErrorTxt);
                end;
            }
        }
    }

}
