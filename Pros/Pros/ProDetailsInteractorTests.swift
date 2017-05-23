import Nimble
import Quick

@testable import Pros

 // swiftlint:disable:next type_body_length
class ProDetailsInteractorSpec: QuickSpec {
        // swiftlint:disable:next function_body_length
        override func spec() {
                var interactor: ProDetailsInteractor!

                var presenterMock: ProDetailsInteractorToPresenterInterfaceMock!

                describe("a ProDetails interactor") {
                        beforeEach {
                                interactor = ProDetailsInteractor()
                                presenterMock = ProDetailsInteractorToPresenterInterfaceMock()

                                interactor.presenter = presenterMock
                        }

                        // MARK: - Operational

                        // MARK: - Presenter to Interactor Interface
                }
        }
}
// swiftlint:disable:this file_length
