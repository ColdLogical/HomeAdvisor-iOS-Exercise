@testable import Pros

class ProListInteractorToPresenterInterfaceMock {
        var functionsCalled = [String]()

        // MARK: - Input Variables
        var error: Error?
        var pros: [Pro]?
}

extension ProListInteractorToPresenterInterfaceMock: ProListInteractorToPresenterInterface {
        func failedGettingPros(withError error: Error) {
                functionsCalled.append(#function)
                self.error = error
        }

        func successGetting(pros: [Pro]) {
                functionsCalled.append(#function)
                self.pros = pros
        }
}
