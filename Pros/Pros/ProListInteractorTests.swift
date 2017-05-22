import Nimble
import Quick

@testable import Pros

 // swiftlint:disable:next type_body_length
class ProListInteractorSpec: QuickSpec {
        // swiftlint:disable:next function_body_length
        override func spec() {
                var interactor: ProListInteractor!

                var presenterMock: ProListInteractorToPresenterInterfaceMock!

                describe("a ProList interactor") {
                        beforeEach {
                                interactor = ProListInteractor()
                                presenterMock = ProListInteractorToPresenterInterfaceMock()

                                interactor.presenter = presenterMock
                        }

                        // MARK: - Operational

                        // MARK: - Presenter to Interactor Interface
                }
        }
}
// swiftlint:disable:this file_length
