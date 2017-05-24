import Nimble
import Quick

@testable import Pros

 // swiftlint:disable:next type_body_length
class ProDetailsWireframeSpec: QuickSpec {
        // swiftlint:disable:next function_body_length
        override func spec() {
                var wireframe: ProDetailsWireframe!

                var presenterMock: ProDetailsWireframeToPresenterInterfaceMock!
                var viewMock: ProDetailsNavigationInterfaceMock!

                describe("a ProDetails wireframe") {
                        beforeEach {
                                wireframe = ProDetailsWireframe()
                                presenterMock = ProDetailsWireframeToPresenterInterfaceMock()
                                viewMock = ProDetailsNavigationInterfaceMock()

                                wireframe.presenter = presenterMock
                                wireframe.view = viewMock
                        }

                        // MARK: - Init
                        describe("init function") {
                                it("instantiates and connect the VIPER stack") {
                                        // Arrange
                                        wireframe = ProDetailsWireframe()

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
                                it("returns the storyboard with the ProDetails storyboard identifier") {
                                        // Arrange
                                        let storyboard = ProDetailsWireframe.storyboard()

                                        // Act

                                        // Assert
                                        let storyboardName = storyboard.value(forKey: "name") as? String
                                        expect(storyboardName).toNot(beNil())
                                        expect(storyboardName).to(equal(ProDetailsConstants.storyboardIdentifier))
                                }
                        }

                        // MARK: - Operational

                        // MARK: - Module Interface
                        describe("when told to present on a navigation controller with a pro") {
                                it("adds the module's view to the navigation controller") {
                                        // Arrange
                                        let fakeWindow = UIWindow(frame: UIScreen.main.bounds)
                                        fakeWindow.makeKeyAndVisible()
                                        let testNavController = UINavigationController(rootViewController: UIViewController())
                                        fakeWindow.rootViewController = testNavController
                                        let fakePro = Pro(withEntityId: "FakeId")

                                        // Act
                                        wireframe.present(onNavigationController: testNavController,
                                                          withPro: fakePro)

                                        // Assert
                                        expect(testNavController.visibleViewController).toEventually(beIdenticalTo(wireframe.moduleView))
                                }

                                it("tells the presenter began presenting with the pro") {
                                        // Arrange
                                        let fakeNavController = UINavigationController()
                                        let testPro = Pro(withEntityId: "TestId")

                                        // Act
                                        wireframe.present(onNavigationController: fakeNavController,
                                                          withPro: testPro)

                                        // Assert
                                        expect(presenterMock.functionsCalled).to(contain("beganPresenting(pro:)"))
                                        expect(presenterMock.pro!.entityId).to(equal(testPro.entityId))
                                }
                        }

                        // MARK: - Presenter to Wireframe Interface
                }
        }
}
// swiftlint:disable:this file_length
