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
                        describe("when getting pros fails") {
                                it("tells the view to not show any pros") {
                                        // Arrange
                                        let fakeError = NSError(domain: "Muldor", code: 666, userInfo: nil)

                                        // Act
                                        presenter.failedGettingPros(withError: fakeError)

                                        // Assert
                                        expect(viewMock.functionsCalled).to(contain("show(proViewObjects:)"))
                                        expect(viewMock.proViewObjects!).to(haveCount(0))
                                }
                        }
                        describe("when getting pros succeeds") {
                                it("tells the view to show the pros") {
                                        // Arrange
                                        let testPro1 = Pro(withEntityId: "FakeId")
                                        let testPro2 = Pro(withEntityId: "FakeId2")
                                        let testPros = [ testPro1, testPro2 ]

                                        // Act
                                        presenter.successGetting(pros: testPros)

                                        // Assert
                                        expect(viewMock.functionsCalled).to(contain("show(proViewObjects:)"))
                                        expect(viewMock.proViewObjects!).to(haveCount(2))
                                }
                        }

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

                        describe("when told the module began presenting") {
                                it("tells the interactor to fetch pros") {
                                        // Arrange

                                        // Act
                                        presenter.beganPresenting()

                                        // Assert
                                        expect(interactorMock.functionsCalled).to(contain("getPros()"))
                                }
                        }
                }
        }
}
// swiftlint:disable:this file_length
