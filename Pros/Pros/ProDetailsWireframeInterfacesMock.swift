@testable import Pros

class ProDetailsWireframeInterfacesMock {
        var functionsCalled = [String]()

        // MARK: - Input Variables
}

extension ProDetailsWireframeInterfacesMock: ProDetails {
        var delegate: ProDetailsDelegate? {
                get {
                        functionsCalled.append(#function)
                        return nil
                }
            set {
                functionsCalled.append(#function)
            }
        }
}

extension ProDetailsWireframeInterfacesMock: ProDetailsPresenterToWireframeInterface {

}
