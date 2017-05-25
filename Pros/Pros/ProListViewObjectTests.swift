import Nimble
import Quick

@testable import Pros

class ProListViewObjectSpec: QuickSpec {
    override func spec() {
        describe("a pro list view object") {
            describe("when initialized from a pro") {
                it("has the values from the pro") {
                    // Arrange
                    var testPro = Pro(withEntityId: "TestId")
                    testPro.companyName = "TestName"
                    testPro.compositeRating = "3.14"
                    testPro.ratingCount = "7"

                    // Act
                    let viewObject = ProListViewObject(fromPro: testPro)

                    // Assert
                    expect(viewObject.entityId).to(equal("TestId"))
                    expect(viewObject.name).to(equal("TestName"))
                    expect(viewObject.numberOfRatings).to(equal("7"))
                    expect(viewObject.rating).to(equal("3.14"))
                }
            }
        }
    }
}
