import Nimble
import Quick

@testable import Pros

class ProDetailsViewObjectSpec: QuickSpec {
    override func spec() {
        describe("a pro list view object") {
            describe("when initialized from a pro") {
                it("has the values from the pro") {
                    // Arrange
                    var testPro = Pro(withEntityId: "TestId")
                    testPro.companyOverview = "TestOverview"
                    testPro.companyName = "TestName"
                    testPro.compositeRating = "3.14"
                    testPro.email = "TestEmail"
                    testPro.primaryLocation = "TestLocation"
                    testPro.ratingCount = "7"
                    testPro.servicesOffered = "TestServices"
                    testPro.specialty = "TestSpecialty"

                    // Act
                    let viewObject = ProDetailsViewObject(fromPro: testPro)

                    // Assert
                    expect(viewObject.entityId).to(equal("TestId"))
                    expect(viewObject.email).to(equal("TestEmail"))
                    expect(viewObject.location).to(equal("TestLocation"))
                    expect(viewObject.name).to(equal("TestName"))
                    expect(viewObject.numberOfRatings).to(equal("7"))
                    expect(viewObject.overview).to(equal("TestOverview"))
                    expect(viewObject.rating).to(equal("3.14"))
                    expect(viewObject.services).to(equal("TestServices"))
                    expect(viewObject.specialty).to(equal("TestSpecialty"))
                }
            }
        }
    }
}
