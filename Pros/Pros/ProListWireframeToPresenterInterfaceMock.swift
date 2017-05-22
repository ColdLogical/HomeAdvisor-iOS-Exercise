@testable import Pros

class ProListWireframeToPresenterInterfaceMock {
        var functionsCalled = [String]()

        // MARK: - Input Variables
        var modifiedDelegate: ProListDelegate?

        // MARK: - Output Variables
        var delegateToReturn: ProListDelegate?
}

extension ProListWireframeToPresenterInterfaceMock: ProListWireframeToPresenterInterface {
        weak var delegate: ProListDelegate? {
                get {
                        functionsCalled.append(#function)
                        return delegateToReturn
                }
        }

        func set(delegate newDelegate: ProListDelegate?) {
                functionsCalled.append(#function)
                modifiedDelegate = newDelegate
        }

        func beganPresenting() {
                functionsCalled.append(#function)
        }
}
