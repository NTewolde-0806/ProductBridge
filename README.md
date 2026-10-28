# ProductBridge

A focused iOS exercise demonstrating bidirectional interoperability
between SwiftUI and UIKit.

## What it demonstrates

- Presenting a UIKit view controller from SwiftUI
- Passing model data from SwiftUI into UIKit
- Reporting UIKit events through a delegate
- Translating delegate callbacks into SwiftUI state through a
  `UIViewControllerRepresentable` coordinator
- Testing the coordinator boundary independently

## Architecture

1. `ContentView` owns the selected product and favorite state.
2. `ProductDetailViewControllerRepresentable` creates the UIKit
   controller.
3. `ProductDetailViewController` reports user actions through its
   delegate.
4. The representable's `Coordinator` receives the callback and updates
   the SwiftUI binding.

## Requirements

- Xcode
- iOS simulator supported by the selected deployment target
- Swift 6

## Validation

- The application builds and runs.
- Selecting a SwiftUI row presents the correct UIKit detail screen.
- Marking a product as a favorite updates the SwiftUI list.
- The focused coordinator test passes.
