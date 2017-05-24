import Nimble
import Quick

@testable import Pros

 // swiftlint:disable:next type_body_length
class ProListWireframeSpec: QuickSpec {
        // swiftlint:disable:next function_body_length
        override func spec() {
                var wireframe: ProListWireframe!

                var presenterMock: ProListWireframeToPresenterInterfaceMock!
                var viewMock: ProListNavigationInterfaceMock!

                var proDetailsMock: ProDetailsWireframeInterfacesMock!

                describe("a ProList wireframe") {
                        beforeEach {
                                wireframe = ProListWireframe()
                                presenterMock = ProListWireframeToPresenterInterfaceMock()
                                viewMock = ProListNavigationInterfaceMock()
                                proDetailsMock = ProDetailsWireframeInterfacesMock()

                                wireframe.presenter = presenterMock
                                wireframe.view = viewMock
                                wireframe.proDetails = proDetailsMock
                        }

                        // MARK: - Init
                        describe("init function") {
                                it("instantiates and connect the VIPER stack") {
                                        // Arrange
                                        wireframe = ProListWireframe()

                                        // Act

                                        // Assert
                                        expect(wireframe).toNot(beNil())
                                        expect(wireframe.moduleInteractor).toNot(beNil())
                                        expect(wireframe.modulePresenter).toNot(beNil())
                                        expect(wireframe.moduleView).toNot(beNil())

                                        expect(wireframe.moduleInteractor.presenter).to(beIdenticalTo(wireframe.modulePresenter))

                                        expect(wireframe.modulePresenter.interactor).to(beIdenticalTo(wireframe.moduleInteractor))
                                        expect(wireframe.modulePresenter.view).to(beIdenticalTo(wireframe.moduleView))
                                        expect(wireframe.modulePresenter.wireframe).to(beIdenticalTo(wireframe))

                                        expect(wireframe.moduleView.presenter).to(beIdenticalTo(wireframe.modulePresenter))

                                        expect(wireframe.presenter).to(beIdenticalTo(wireframe.modulePresenter))
                                        expect(wireframe.view).to(beIdenticalTo(wireframe.moduleView))
                                }
                        }

                        // MARK: - Class Functions
                        describe("storyboard class function") {
                                it("returns the storyboard with the ProList storyboard identifier") {
                                        // Arrange
                                        let storyboard = ProListWireframe.storyboard()

                                        // Act

                                        // Assert
                                        let storyboardName = storyboard.value(forKey: "name") as? String
                                        expect(storyboardName).toNot(beNil())
                                        expect(storyboardName).to(equal(ProListConstants.storyboardIdentifier))
                                }
                        }

                        // MARK: - Operational

                        // MARK: - Module Interface
                        describe("when told to present in a window") {
                                it("makes the modules navigation controller the windows root view controller") {
                                        // Arrange
                                        let testWindow = UIWindow()

                                        // Act
                                        wireframe.present(inWindow: testWindow)

                                        // Assert
                                        expect(testWindow.rootViewController!).to(equal(wireframe.moduleNavigationController))
                                }

                                it("tells the presenter the module began presenting") {
                                        // Arrange
                                        let fakeWindow = UIWindow()

                                        // Act
                                        wireframe.present(inWindow: fakeWindow)

                                        // Assert
                                        expect(presenterMock.functionsCalled).to(contain("beganPresenting()"))
                                }
                        }

                        // MARK: - Presenter to Wireframe Interface
                        describe("when told to present details for a pro") {
                                it("tells the pro details module to present on the module's navigation controller with the pro") {
                                        // Arrange
                                        let testPro = Pro(withEntityId: "TestId")

                                        // Act
                                        wireframe.presentDetails(forPro: testPro)

                                        // Assert
                                        expect(proDetailsMock.functionsCalled).to(contain("present(onNavigationController:withPro:)"))
                                        expect(proDetailsMock.onNavigationController).to(beIdenticalTo(wireframe.moduleNavigationController))
                                        expect(proDetailsMock.withPro!.entityId).to(equal("TestId"))
                                }
                        }
                }
        }
}
// swiftlint:disable:this file_length
