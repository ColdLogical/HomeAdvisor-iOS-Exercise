import Nimble
import Quick

@testable import Pros

 // swiftlint:disable:next type_body_length
class ProDetailsPresenterSpec: QuickSpec {
        // swiftlint:disable:next function_body_length
        override func spec() {
                var presenter: ProDetailsPresenter!

                var interactorMock: ProDetailsPresenterToInteractorInterfaceMock!
                var viewMock: ProDetailsPresenterToViewInterfaceMock!
                var wireframeMock: ProDetailsWireframeInterfacesMock!

                describe("a ProDetails presenter") {
                        beforeEach {
                                presenter = ProDetailsPresenter()
                                interactorMock = ProDetailsPresenterToInteractorInterfaceMock()
                                viewMock = ProDetailsPresenterToViewInterfaceMock()
                                wireframeMock = ProDetailsWireframeInterfacesMock()

                                presenter.interactor = interactorMock
                                presenter.view = viewMock
                                presenter.wireframe = wireframeMock
                        }

                        // MARK: - Operational

                        // MARK: - Interactor to Presenter Interface

                        // MARK: - View to Presenter Interface

                        // MARK: - Wireframe to Presenter Interface
                        describe("when told began presenting with a pro") {
                                it("tells the view to show a view object for the pro") {
                                        // Arrange
                                        let testPro = Pro(withEntityId: "TestId")

                                        // Act
                                        presenter.beganPresenting(pro: testPro)

                                        // Assert
                                        expect(viewMock.functionsCalled).to(contain("show(proDetails:)"))
                                        expect(viewMock.proDetails!.entityId).to(equal("TestId"))
                                }
                        }
                }
        }
}
// swiftlint:disable:this file_length
