@testable import Pros

class ProListViewToPresenterInterfaceMock {
        var functionsCalled = [String]()

        // MARK: - Input Variables
        var proListViewObject: ProListViewObject?
}

extension ProListViewToPresenterInterfaceMock: ProListViewToPresenterInterface {
        func userSelected(proListViewObject: ProListViewObject) {
                functionsCalled.append(#function)
                self.proListViewObject = proListViewObject
        }
}
