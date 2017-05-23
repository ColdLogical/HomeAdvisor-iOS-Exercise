import Nimble
import Quick

@testable import Pros

 // swiftlint:disable:next type_body_length
class ProListInteractorSpec: QuickSpec {
        // swiftlint:disable:next function_body_length
        override func spec() {
                var interactor: ProListInteractor!

                var presenterMock: ProListInteractorToPresenterInterfaceMock!
                var prosServiceMock: ProsServiceMock!

                describe("a ProList interactor") {
                        beforeEach {
                                interactor = ProListInteractor()
                                presenterMock = ProListInteractorToPresenterInterfaceMock()
                                prosServiceMock = ProsServiceMock()

                                interactor.presenter = presenterMock
                                interactor.prosService = prosServiceMock
                        }

                        // MARK: - Operational

                        // MARK: - Presenter to Interactor Interface
                        describe("when told to get pros") {
                                it("tells the pros service to fetch pros") {
                                        // Arrange

                                        // Act
                                        interactor.getPros()

                                        // Assert
                                        expect(prosServiceMock.functionsCalled).to(contain("fetchPros(success:failure:)"))
                                }

                                context("when the service succeeds") {
                                        it("gives the pros to the presenter") {
                                                // Arrange
                                                let testPro = Pro(withEntityId: "TestId")
                                                prosServiceMock.successValueToReturn = [ testPro ]

                                                // Act
                                                interactor.getPros()

                                                // Assert
                                                expect(presenterMock.functionsCalled).to(contain("successGetting(pros:)"))
                                                expect(presenterMock.pros!).to(haveCount(1))
                                                expect(presenterMock.pros![0].entityId).to(equal("TestId"))
                                        }
                                }

                                context("when the pros service fails") {
                                        it("gives the error to the presenter") {
                                                // Arrange
                                                let testError = NSError(domain: "Muldor", code: 666, userInfo: nil)
                                                prosServiceMock.failureValueToReturn = testError

                                                // Act
                                                interactor.getPros()

                                                // Assert
                                                expect(presenterMock.functionsCalled).to(contain("failedGettingPros(withError:)"))
                                                expect(presenterMock.error).to(beIdenticalTo(testError))
                                        }
                                }
                        }
                }
        }
}
// swiftlint:disable:this file_length
