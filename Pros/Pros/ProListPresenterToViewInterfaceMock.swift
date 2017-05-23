@testable import Pros

class ProListPresenterToViewInterfaceMock {
        var functionsCalled = [String]()

        // MARK: - Input Variables
        var proViewObjects: [ProViewObject]?
}

extension ProListPresenterToViewInterfaceMock: ProListPresenterToViewInterface {
        func show(proViewObjects: [ProViewObject]) {
                functionsCalled.append(#function)
                self.proViewObjects = proViewObjects
        }
}
