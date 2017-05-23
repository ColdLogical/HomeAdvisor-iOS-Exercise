@testable import Pros

class ProListPresenterToInteractorInterfaceMock {
        var functionsCalled = [String]()

        // MARK: - Input Variables
}

extension ProListPresenterToInteractorInterfaceMock: ProListPresenterToInteractorInterface {
        func getPros() {
                functionsCalled.append(#function)
        }
}
