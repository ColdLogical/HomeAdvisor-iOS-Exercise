import Nimble
import Quick

@testable import Pros

 // swiftlint:disable:next type_body_length
class ProListViewSpec: QuickSpec {
        // swiftlint:disable:next function_body_length
        override func spec() {
                var view: ProListView!

                var presenterMock: ProListViewToPresenterInterfaceMock!

                describe("a ProList view") {
                        beforeEach {
                                let sb = ProListWireframe.storyboard()
                                view = (sb.instantiateViewController(withIdentifier: ProListConstants.viewIdentifier) as? ProListView)!
                                presenterMock = ProListViewToPresenterInterfaceMock()

                                _ = view.view

                                view.presenter = presenterMock
                        }

                        // MARK: - Operational
                        describe("when a cell is selected") {
                                it("tells the presenter the user selected the pro") {
                                        // Arrange
                                        let testPro = Pro(withEntityId: "TestId")
                                        let testProListViewObject = ProListViewObject(fromPro: testPro)
                                        view.show(proListViewObjects: [ testProListViewObject ])

                                        let testIndexPath = IndexPath(row: 0, section: 0)

                                        // Act
                                        view.tableView(view.tableView, didSelectRowAt: testIndexPath)

                                        // Assert
                                        expect(presenterMock.functionsCalled).to(contain("userSelected(proListViewObject:)"))
                                        expect(presenterMock.proListViewObject!.entityId).to(equal("TestId"))
                                }
                        }

                        // MARK: - Cell Tests
                        context("when there is a table view cell") {
                                // MARK: - Helper
                                func cellForPro(withRating rating: String) -> ProCell {
                                        var testPro = Pro(withEntityId: "TestId")
                                        testPro.ratingCount = "20"
                                        testPro.compositeRating = rating

                                        let testProListViewObject = ProListViewObject(fromPro: testPro)

                                        view.show(proListViewObjects: [ testProListViewObject ])
                                        let testIndexPath = IndexPath(row: 0, section: 0)

                                        let cell = (view.tableView(view.tableView, cellForRowAt: testIndexPath) as? ProCell)!

                                        return cell
                                }

                                describe("for a pro with a rating 4.0 and above") {
                                        it("shows the rating label in green") {
                                                // Arrange
                                                let testRating = "4.0"

                                                // Act
                                                let proCell = cellForPro(withRating: testRating)

                                                // Assert
                                                expect(proCell.ratingLabel.textColor).to(equal(UIColor.green))
                                        }
                                }

                                describe("for a pro with a rating between 3.0 and 3.99") {
                                        context("when the rating is 3.0") {
                                                it("shows the rating label in orange") {
                                                        // Arrange
                                                        let testRating = "3.0"

                                                        // Act
                                                        let proCell = cellForPro(withRating: testRating)

                                                        // Assert
                                                        expect(proCell.ratingLabel.textColor).to(equal(UIColor.orange))
                                                }
                                        }

                                        context("when the rating is 3.99") {
                                                it("shows the rating label in orange") {
                                                        // Arrange
                                                        let testRating = "3.99"

                                                        // Act
                                                        let proCell = cellForPro(withRating: testRating)

                                                        // Assert
                                                        expect(proCell.ratingLabel.textColor).to(equal(UIColor.orange))
                                                }
                                        }
                                }

                                describe("for a pro with a rating below 3.0") {
                                        it("shows the rating label in red") {
                                                // Arrange
                                                let testRating = "2.99"

                                                // Act
                                                let proCell = cellForPro(withRating: testRating)

                                                // Assert
                                                expect(proCell.ratingLabel.textColor).to(equal(UIColor.red))
                                        }
                                }
                        }

                        // MARK: - Presenter to View Interface
                        describe("when told to show pros") {
                                it("sorts them alphabetically") {
                                        // Arrange
                                        var aPro = Pro(withEntityId: "1")
                                        aPro.companyName = "Ardvark"
                                        var mPro = Pro(withEntityId: "2")
                                        mPro.companyName = "Mammoth"
                                        var zPro = Pro(withEntityId: "3")
                                        zPro.companyName = "zebra"

                                        let testProListViewObjects = [
                                                ProListViewObject(fromPro: mPro),
                                                ProListViewObject(fromPro: zPro),
                                                ProListViewObject(fromPro: aPro),
                                        ]

                                        // Act
                                        view.show(proListViewObjects: testProListViewObjects)

                                        // Assert
                                        expect(view.proListViewObjects[0].name).to(equal("Ardvark"))
                                        expect(view.proListViewObjects[1].name).to(equal("Mammoth"))
                                        expect(view.proListViewObjects[2].name).to(equal("zebra"))
                                }
                        }
                }
        }
} // swiftlint:disable:next file_length
