controladdin DVLPRControlAddIn
{
    RequestedHeight = 300;
    MinimumHeight = 300;
    MaximumHeight = 300;
    RequestedWidth = 700;
    MinimumWidth = 700;
    MaximumWidth = 700;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    StartupScript = 'start.js';
    StyleSheets = 'style.css';
    Scripts = 'scripts.js';

    procedure Render(html: Text);
    procedure Animate();
    event OnControlAddInReady();
    event ShowError(ErrorTxt: Text);

}