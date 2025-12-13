namespace dvlprlife.usercontrol1.ChristmasTree;
controladdin DVLPRControlAddIn
{
    HorizontalShrink = true;
    HorizontalStretch = true;
    MaximumHeight = 300;
    MaximumWidth = 700;
    MinimumHeight = 300;
    MinimumWidth = 700;
    RequestedHeight = 300;
    RequestedWidth = 700;
    Scripts = 'controladdin/scripts.js';
    StartupScript = 'controladdin/start.js';
    StyleSheets = 'controladdin/style.css';
    VerticalShrink = true;
    VerticalStretch = true;

    procedure Animate()
    procedure Render(html: Text);
    event OnControlAddInReady();
    event ShowError(ErrorTxt: Text);
}