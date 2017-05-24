import UIKit

// VIPER Module Constants
struct ProListConstants {
        static let navigationControllerIdentifier = "ProListNavigationController"
        static let storyboardIdentifier = "ProList"
        static let viewIdentifier = "ProListView"
}

// Interface Abstraction for working with the VIPER Module
protocol ProList: class {
        func present(inWindow window: UIWindow)
}

// VIPER Interface for communication from Presenter -> Wireframe
protocol ProListPresenterToWireframeInterface: class {
        func presentDetails(forPro pro: Pro)
}
