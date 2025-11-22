documentElement = document.getElementById('controlAddIn');
document.getElementById('controlAddIn').innerHTML = '<div class="tree"><div class="lights"><div class="light"></div><div class="light"></div><div class="light"></div><div class="light"></div><div class="light"></div><div class="stump"></div></div></div>';

Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('OnControlAddInReady');
