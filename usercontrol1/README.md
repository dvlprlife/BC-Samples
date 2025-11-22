# Christmas Tree User Control Sample

This sample AL application demonstrates how to create and host a custom JavaScript control add-in inside Microsoft Dynamics 365 Business Central. A simple page hosts a festive "Merry Christmas" banner that scrolls horizontally using browser animation APIs.

## What the Sample Shows
- Declaring a `controladdin` object (`DVLPRControlAddIn`) with startup scripts and style sheets.
- Exposing JavaScript procedures (`Render`, `Animate`) and events for AL to call.
- Rendering HTML content into the control surface from AL when the control add-in signals it is ready.
- Performing lightweight DOM manipulation and animation and surfacing errors back to AL via `InvokeExtensibilityMethod`.

## Solution Structure
- `DVLPRChristmasTreePage.Page.al` creates page 50100 and wires the control add-in.
- `DVLPRControlAddIn.ControlAddin.al` defines the control add-in and its callable surface.
- `start.js` bootstraps the control add-in (Business Central loads this automatically).
- `scripts.js` implements the rendering and animation logic.
- `style.css` contains styling for the marquee effect.

## Running the Sample
1. Publish the extension to a Business Central sandbox.
2. Open page 50100 **Christmas Tree Page**.
3. Wait for the control add-in to initialize; the banner text will render and scroll across the view. Errors encountered in the browser are relayed to Business Central through the `ShowError` event.

This example focuses on demonstrating the pattern for coupling AL and JavaScript through a control add-in while keeping the implementation intentionally simple and approachable.