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
    Scripts = 'scripts.js';
    StartupScript = 'start.js';
    StyleSheets = 'style.css';
    VerticalShrink = true;
    VerticalStretch = true;

    procedure Animate()
    procedure Render(html: Text);
    event OnControlAddInReady();
    event ShowError(ErrorTxt: Text);
}