function Render(html) {
    try {
        document.getElementById('controlAddIn').innerHTML = html;
    }
    catch (e) {
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ShowError', [e.toString()]);
    }
}