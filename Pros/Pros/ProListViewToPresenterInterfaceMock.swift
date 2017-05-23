@testable import Pros

class ProListViewToPresenterInterfaceMock {
        var functionsCalled = [String]()

        // MARK: - Input Variables
        var proViewObject: ProViewObject?
}

extension ProListViewToPresenterInterfaceMock: ProListViewToPresenterInterface {
        func userSelected(proViewObject: ProViewObject) {
                functionsCalled.append(#function)
                self.proViewObject = proViewObject
        }
}
