namespace dvlprlife.usercontrol2.PopGame;
controladdin DVLPRPopGameControlAddIn
{
    HorizontalStretch = true;
    Scripts = 'script.js';
    StartupScript = 'start.js';
    StyleSheets = 'styles.css';
    VerticalStretch = true;

    procedure Render(html: Text)
    event OnControlAddInReady();
    event ShowError(ErrorTxt: Text);
}