@testable import Pros

class ProDetailsPresenterToViewInterfaceMock {
        var functionsCalled = [String]()

        // MARK: - Input Variables
        var proDetails: ProDetailsViewObject?
}

extension ProDetailsPresenterToViewInterfaceMock: ProDetailsPresenterToViewInterface {
        func show(proDetails viewObject: ProDetailsViewObject) {
                functionsCalled.append(#function)
                proDetails = viewObject
        }
}
