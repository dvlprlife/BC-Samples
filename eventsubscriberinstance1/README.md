# eventsubscriberinstance1

## Overview
This AL sample shows how to manually bind and unbind event subscribers at runtime. The extension adds helper actions to the **Customer List** that optionally bind a subscriber before opening the **Customer Card** so you can observe how the `EventSubscriberInstance = Manual` setting works in practice.

## Prerequisites
- Microsoft Dynamics 365 Business Central application version 27.0 or later (runtime 16.0)
- VS Code with the AL Language extension
- Access to a Business Central sandbox where you can publish test extensions

## How It Works
- `DVLPRCustomerListExt.PageExt.al` adds two actions to the **Customer List**: one opens the **Customer Card** normally, the other binds the subscriber before opening.
- `DVLPRBindSubscriptionExample.Codeunit.al` implements the helper procedures that open the page, invoking `Session.BindSubscription` and `Session.UnbindSubscription` around the modal page call when requested.
- `DVLPRSubscriptionManagement.Codeunit.al` declares `EventSubscriberInstance = Manual` and contains the `OnOpenPageEvent` subscriber that displays a simple "Hello world" message once bound.

When you use the binding action, the subscriber is activated just for that session, which demonstrates a practical pattern for enabling opt-in telemetry or debugging behavior without leaving the subscriber permanently active.

## Try It Out
1. Publish the extension to your sandbox (`AL: Publish` or `F5`).
2. Open the **Customer List** page.
3. Run **Open Customer Card** to see the page open with no bound subscriber.
4. Run **Open Customer Card with Binding** and notice the "Hello world" message triggered from the subscriber while the page is open.
5. Close the page; the subscriber is unbound automatically.

## Extending The Sample
- Replace the `Message` call with your own logic (logging, diagnostics, telemetry, feature toggles).
- Add additional subscribers to `DVLPR Subscription Management` to observe how multiple handlers behave when bound manually.
- Experiment with binding in background sessions to understand the lifetime of manual subscribers.

## Additional Resources
- [Session.BindSubscription Method](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/methods-auto/session/session-bindsubscription-method)
- [EventSubscriberInstance Property](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/properties/devenv-eventsubscriberinstance-property)
