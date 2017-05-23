@testable import Pros

class ProDetailsWireframeToPresenterInterfaceMock {
        var functionsCalled = [String]()

        // MARK: - Input Variables
        var pro: Pro?

        // MARK: - Output Variables
}

extension ProDetailsWireframeToPresenterInterfaceMock: ProDetailsWireframeToPresenterInterface {
        func beganPresenting(pro: Pro) {
                functionsCalled.append(#function)
                self.pro = pro
        }
}
