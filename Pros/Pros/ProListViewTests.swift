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
                                view = ProListView()
                                presenterMock = ProListViewToPresenterInterfaceMock()

                                _ = view.view

                                view.presenter = presenterMock
                        }

                        // MARK: - Operational
                        describe("when a cell is selected") {
                                it("tells the presenter the user selected the pro") {
                                        // Arrange
                                        let testPro = Pro(withEntityId: "TestId")
                                        let testProViewObject = ProViewObject(fromPro: testPro)
                                        view.show(proViewObjects: [ testProViewObject ])

                                        let testIndexPath = IndexPath(row: 0, section: 0)

                                        // Act
                                        view.tableView(view.tableView, didSelectRowAt: testIndexPath)

                                        // Assert
                                        expect(presenterMock.functionsCalled).to(contain("userSelected(proViewObject:)"))
                                        expect(presenterMock.proViewObject!.entityId).to(equal("TestId"))
                                }
                        }

                        // MARK: - Presenter to View Interface
                        describe("when told to show pros") {
                                it("sorts them alphabetically") {
                                        // Arrange
                                        let aPro = Pro(withEntityId: "1")
                                        pro.companyName = "Ardvark"
                                        let mPro = Pro(withEntityId: "2")
                                        pro.companyName = "Mammoth"
                                        let zPro = Pro(withEntityId: "3")
                                        pro.companyName = "zebra"

                                        let testProViewObjects = [
                                                ProViewObject(fromPro: mPro),
                                                ProViewObject(fromPro: zPro),
                                                ProViewObject(fromPro: aPro),
                                        ]

                                        // Act
                                        view.show(proViewObjects: testProViewObjects)

                                        // Assert
                                        expect(view.proViewObjects[0].name).to(equal("Ardvark"))
                                        expect(view.proViewObjects[1].name).to(equal("Mammoth"))
                                        expect(view.proViewObjects[2].name).to(equal("zebra"))
                                }
                        }
                }
        }
}
// swiftlint:disable:this file_length
