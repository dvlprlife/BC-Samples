# Business Central Code Samples

A collection of code samples and examples for Microsoft Dynamics 365 Business Central development. This repository common patterns, and practical solutions for extending and customizing Business Central using AL.

## Contents

| Project | Description | Object Range |
|---------|-------------|--------------|
| [abouttitle1](abouttitle1/) | Using `AboutTitle` and `AboutText` properties to provide contextual teaching tips on pages and fields | 50150–50159 |
| [accessproperty1](accessproperty1/) | Demonstrates the `Access` property on table fields to control field visibility across extensions | 50140–50149 |
| [eventsubscriberinstance1](eventsubscriberinstance1/) | Manually binding and unbinding event subscribers at runtime using `EventSubscriberInstance = Manual` | 50130–50139 |
| [getresource1](getresource1/) | Loading embedded resource files (JSON, text, images) from an extension using `NavApp.GetResource` methods | 50120–50129 |
| [interface1](interface1/) | Implementing AL interfaces with an enum-based strategy pattern for pluggable discount calculations | 50160–50169 |
| [pagebackgroundtasks1](pagebackgroundtasks1/) | Using `CurrPage.EnqueueBackgroundTask` to offload data aggregation to page background tasks | 50120–50129 |
| [sessionlogmessage1](sessionlogmessage1/) | Using `Session.LogMessage` to emit custom telemetry events to Application Insights | 50170–50179 |
| [typehelper1](typehelper1/) | Demonstrates useful procedures from the `Type Helper` codeunit | 50180–50189 |
| [usercontrol1](usercontrol1/) | Creating a JavaScript control add-in that renders an animated scrolling banner | 50100–50109 |
| [usercontrol2](usercontrol2/) | Hosting an interactive JavaScript arcade game inside a Business Central page via a control add-in | 50110–50119 |

## Who This Is For

- Business Central developers looking for code examples
- Consultants looking for code examples in Business Central solutions

## Getting Started

Clone this repository and explore the folders organized by feature type. Each sample includes comments explaining the implementation and key concepts.

## Prerequisites

- Microsoft Dynamics 365 Business Central
- Visual Studio Code with AL Language extension

## Contributing

Contributions are welcome! Please ensure code examples include comments and follow AL coding standards.

## License

[Choose appropriate license - MIT, Apache 2.0, etc.]

---

**Note**: These samples are provided as-is for educational and reference purposes. Always test thoroughly before deploying to production environments.
