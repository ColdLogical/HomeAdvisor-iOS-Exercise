@testable import Pros

class ProDetailsWireframeToPresenterInterfaceMock {
        var functionsCalled = [String]()

        // MARK: - Input Variables
        var modifiedDelegate: ProDetailsDelegate?

        // MARK: - Output Variables
        var delegateToReturn: ProDetailsDelegate?
}

extension ProDetailsWireframeToPresenterInterfaceMock: ProDetailsWireframeToPresenterInterface {
        weak var delegate: ProDetailsDelegate? {
                get {
                        functionsCalled.append(#function)
                        return delegateToReturn
                }
        }

        func set(delegate newDelegate: ProDetailsDelegate?) {
                functionsCalled.append(#function)
                modifiedDelegate = newDelegate
        }
}
