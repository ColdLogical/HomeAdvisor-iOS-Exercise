import Nimble
import Quick

@testable import Pros

 // swiftlint:disable:next type_body_length
class ProDetailsPresenterSpec: QuickSpec {
        // swiftlint:disable:next function_body_length
        override func spec() {
                var presenter: ProDetailsPresenter!

                var delegateMock: ProDetailsDelegateMock!
                var interactorMock: ProDetailsPresenterToInteractorInterfaceMock!
                var viewMock: ProDetailsPresenterToViewInterfaceMock!
                var wireframeMock: ProDetailsWireframeInterfacesMock!

                describe("a ProDetails presenter") {
                        beforeEach {
                                presenter = ProDetailsPresenter()
                                delegateMock = ProDetailsDelegateMock()
                                interactorMock = ProDetailsPresenterToInteractorInterfaceMock()
                                viewMock = ProDetailsPresenterToViewInterfaceMock()
                                wireframeMock = ProDetailsWireframeInterfacesMock()

                                presenter.delegate = delegateMock
                                presenter.interactor = interactorMock
                                presenter.view = viewMock
                                presenter.wireframe = wireframeMock
                        }

                        // MARK: - Operational

                        // MARK: - Interactor to Presenter Interface

                        // MARK: - View to Presenter Interface

                        // MARK: - Wireframe to Presenter Interface

                }
        }
}
// swiftlint:disable:this file_length
