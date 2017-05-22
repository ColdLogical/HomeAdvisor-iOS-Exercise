import Nimble
import Quick

@testable import Pros

 // swiftlint:disable:next type_body_length
class ProListPresenterSpec: QuickSpec {
        // swiftlint:disable:next function_body_length
        override func spec() {
                var presenter: ProListPresenter!

                var delegateMock: ProListDelegateMock!
                var interactorMock: ProListPresenterToInteractorInterfaceMock!
                var viewMock: ProListPresenterToViewInterfaceMock!
                var wireframeMock: ProListWireframeInterfacesMock!

                describe("a ProList presenter") {
                        beforeEach {
                                presenter = ProListPresenter()
                                delegateMock = ProListDelegateMock()
                                interactorMock = ProListPresenterToInteractorInterfaceMock()
                                viewMock = ProListPresenterToViewInterfaceMock()
                                wireframeMock = ProListWireframeInterfacesMock()

                                presenter.delegate = delegateMock
                                presenter.interactor = interactorMock
                                presenter.view = viewMock
                                presenter.wireframe = wireframeMock
                        }

                        // MARK: - Operational
                        describe("module wireframe computed variable") {
                                it("returns the wireframe as a ProList object") {
                                        // Arrange

                                        // Act
                                        let moduleWireframe = presenter.moduleWireframe

                                        // Assert
                                        expect(moduleWireframe).to(beIdenticalTo(wireframeMock))
                                }
                        }

                        // MARK: - Interactor to Presenter Interface

                        // MARK: - View to Presenter Interface

                        // MARK: - Wireframe to Presenter Interface
                        describe("set delegate function") {
                                it("sets the input as the new delegate") {
                                        // Arrange
                                        presenter.delegate = nil
                                        let testDelegate = ProListDelegateMock()

                                        // Act
                                        presenter.set(delegate: testDelegate)

                                        // Assert
                                        expect(presenter.delegate).to(beIdenticalTo(testDelegate))
                                }
                        }
                }
        }
}
// swiftlint:disable:this file_length
