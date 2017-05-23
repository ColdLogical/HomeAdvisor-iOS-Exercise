@testable import Pros

class ProsServiceMock {
        var functionsCalled = [String]()

        // MARK: - Input Variables

        // MARK: - Output Variables
        var failureValueToReturn: Error?
        var successValueToReturn: [Pro]?
}

extension ProsServiceMock: ProsService {
        func fetchPros(success: ([Pro]) -> Void,
                       failure: (Error) -> Void) {
                functionsCalled.append(#function)

                if let pros = successValueToReturn {
                        success(pros)
                }

                if let error = failureValueToReturn {
                        failure(error)
                }
        }
}
