function Render(html) {
    try {
        document.body.insertAdjacentHTML('beforeend', html);
    }
    catch (e) {
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ShowError', [e.toString()]);
    }
}

function Animate() {
    try {
        const merryText = document.getElementById('scrolltext')
        //merryText.style.backgroundColor = 'red';

        let merryX = window.innerWidth;
        const speed = 2;

        function animateMerry() {
            merryX -= speed;
            if (merryX < -merryText.offsetWidth) {
                merryX = window.innerWidth;
            }
            merryText.style.left = merryX + 'px';
            requestAnimationFrame(animateMerry);
        }

        animateMerry();
    } catch (e) {
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('ShowError', [e.toString()]);
    }
}