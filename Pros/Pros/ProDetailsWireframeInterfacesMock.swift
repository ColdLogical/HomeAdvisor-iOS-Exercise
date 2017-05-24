import UIKit

@testable import Pros

class ProDetailsWireframeInterfacesMock {
        var functionsCalled = [String]()

        // MARK: - Input Variables
        var onNavigationController: UINavigationController?
        var withPro: Pro?
}

extension ProDetailsWireframeInterfacesMock: ProDetails {
        func present(onNavigationController navigationController: UINavigationController,
                     withPro pro: Pro) {
                functionsCalled.append(#function)
                onNavigationController = navigationController
                withPro = pro
        }
}

extension ProDetailsWireframeInterfacesMock: ProDetailsPresenterToWireframeInterface {

}
