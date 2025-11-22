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

    procedure Render(html: Text)
    procedure Animate()
    event OnControlAddInReady();
    event ShowError(ErrorTxt: Text);
}