@testable import Pros

class ProListPresenterToViewInterfaceMock {
        var functionsCalled = [String]()

        // MARK: - Input Variables
        var proListViewObjects: [ProListViewObject]?
}

extension ProListPresenterToViewInterfaceMock: ProListPresenterToViewInterface {
        func show(proListViewObjects: [ProListViewObject]) {
                functionsCalled.append(#function)
                self.proListViewObjects = proListViewObjects
        }
}
