import UIKit

// VIPER Module Constants
struct ProDetailsConstants {
        static let storyboardIdentifier = "ProDetails"
        static let viewIdentifier = "ProDetailsView"
}

// Interface Abstraction for working with the VIPER Module
protocol ProDetails: class {
        func present(onNavigationController navigationController: UINavigationController,
                     withPro pro: Pro)
}

// VIPER Interface for communication from Presenter -> Wireframe
protocol ProDetailsPresenterToWireframeInterface: class {

}
