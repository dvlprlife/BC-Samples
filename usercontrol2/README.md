# Pop Game User Control Sample

This sample AL application demonstrates how to host an interactive JavaScript game inside Microsoft Dynamics 365 Business Central. A page-level control add-in renders a "circle popping" arcade experience that tracks score, misses, and time while communicating lifecycle events back to AL.

## What the Sample Shows
- Declaring the `controladdin` object (`DVLPRPopGameControlAddIn`) with startup script, runtime script, stylesheet, and stretch properties.
- Raising `OnControlAddInReady` from JavaScript to signal AL when the game surface is initialized.
- Handling control add-in events in AL to surface initialization status and browser errors.
- Managing an accessible game loop in JavaScript with DOM manipulation, timers, and state updates.

## Solution Structure
- `DVLPRPopGamePage.Page.al` defines page 50110 and hosts the control add-in.
- `DVLPRPopGameControlAddIn.ControlAddin.al` registers the control add-in interface and exposed procedures/events.
- `start.js` bootstraps the game UI, registers event handlers, and kicks off the gameplay loop.
- `script.js` implements the `Render` procedure surfaced to AL for optional dynamic content injection.
- `styles.css` styles the heads-up display and animated circles.

## Running the Sample
1. Publish the extension to a Business Central sandbox.
2. Open page 50110 **Pop Game Page**.
3. Wait for the control add-in to finish initializing (AL shows a confirmation message), then select **Start Game** to begin. For sixty seconds, circles appear at random positions—click to pop them, and watch the HUD update in real time. Any browser errors bubble back through the `ShowError` event.

**Note:** The code and information discussed in this article are for informational and demonstration purposes only. This content was created referencing Microsoft Dynamics 365 Business Central 2025 Wave 2 online. This example focuses on blending AL event handling with a richer JavaScript experience, illustrating how to coordinate UI state, timers, and accessibility considerations within a Business Central control add-in.
