import Nimble
import Quick

@testable import Pros

 // swiftlint:disable:next type_body_length
class ProListPresenterSpec: QuickSpec {
        // swiftlint:disable:next function_body_length
        override func spec() {
                var presenter: ProListPresenter!

                var interactorMock: ProListPresenterToInteractorInterfaceMock!
                var viewMock: ProListPresenterToViewInterfaceMock!
                var wireframeMock: ProListWireframeInterfacesMock!

                describe("a ProList presenter") {
                        beforeEach {
                                presenter = ProListPresenter()
                                interactorMock = ProListPresenterToInteractorInterfaceMock()
                                viewMock = ProListPresenterToViewInterfaceMock()
                                wireframeMock = ProListWireframeInterfacesMock()

                                presenter.interactor = interactorMock
                                presenter.view = viewMock
                                presenter.wireframe = wireframeMock
                        }

                        // MARK: - Operational

                        // MARK: - Interactor to Presenter Interface
                        describe("when getting pros fails") {
                                it("tells the view to not show any pros") {
                                        // Arrange
                                        let fakeError = NSError(domain: "Muldor", code: 666, userInfo: nil)

                                        // Act
                                        presenter.failedGettingPros(withError: fakeError)

                                        // Assert
                                        expect(viewMock.functionsCalled).to(contain("show(proListViewObjects:)"))
                                        expect(viewMock.proListViewObjects!).to(haveCount(0))
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
                                        expect(viewMock.functionsCalled).to(contain("show(proListViewObjects:)"))
                                        expect(viewMock.proListViewObjects!).to(haveCount(2))
                                }
                        }

                        // MARK: - View to Presenter Interface
                        describe("when told a user selected a pro") {
                                it("tells the wireframe to present pro details for the pro") {
                                        // Arrange
                                        let testPro = Pro(withEntityId: "TestId")
                                        let viewObject = ProListViewObject(fromPro: testPro)

                                        presenter.successGetting(pros: [ testPro ])

                                        // Act
                                        presenter.userSelected(proListViewObject: viewObject)

                                        // Assert
                                        expect(wireframeMock.functionsCalled).to(contain("presentDetails(forPro:)"))
                                        expect(wireframeMock.forPro!.entityId).to(equal("TestId"))
                                }
                        }

                        // MARK: - Wireframe to Presenter Interface
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
