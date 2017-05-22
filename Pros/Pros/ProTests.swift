import Nimble
import Quick

@testable import Pros

 // swiftlint:disable:next type_body_length
class ProSpec: QuickSpec {
        // MARK: - Test Json
        lazy var invalidJson: [String: Any] = [
                "notEntityId":"invalidIdentifier",
        ]
        lazy var invalidIdJson: [String: Any] = [
                "entityId": "",
        ]
        lazy var jsonArray: [ [String: Any] ] = [
                self.validJson,
                self.invalidJson,
                self.invalidIdJson,
                self.validJson,
        ]
        lazy var validJson: [String: Any] = [
                "entityId":"1222893113",
                "companyName":"Summit Preservation, LLC",
                "ratingCount":"7",
                "compositeRating":"5.0",
                "companyOverview":"Prides itself on beautiful surfaces",
                "canadianSP":false,
                "spanishSpeaking":false,
                "phoneNumber":"(330) 555-3136",
                "latitude":39.8873,
                "longitude":-104.8805,
                "servicesOffered":"Flooring & Carpet, Tile",
                "specialty":"Additions & Remodeling",
                "primaryLocation":"Henderson, CO",
                "email":"contact@summitpresllc.biz",
        ]

        // swiftlint:disable:next function_body_length
        override func spec() {
                describe("a pro object") {
                        // MARK: - Initialization Tests
                        describe("when initialized from valid json") {
                                it("returns an object with values from the json") {
                                        // Arrange
                                        let testJson = self.validJson

                                        // Act
                                        let pro = Pro(fromJson: testJson)

                                        // Assert
                                        expect(pro).toNot(beNil())
                                        expect(pro!.entityId).to(equal("1222893113"))
                                        expect(pro!.companyName).to(equal("Summit Preservation, LLC"))
                                        expect(pro!.ratingCount).to(equal("7"))
                                        expect(pro!.compositeRating).to(equal("5.0"))
                                        let companyOverview = "Prides itself on beautiful surfaces"
                                        expect(pro!.companyOverview).to(equal(companyOverview))
                                        expect(pro!.canadianSP).to(beFalse())
                                        expect(pro!.spanishSpeaking).to(beFalse())
                                        expect(pro!.phoneNumber).to(equal("(330) 555-3136"))
                                        expect(pro!.latitude).to(equal(39.8873))
                                        expect(pro!.longitude).to(equal(-104.8805))
                                        expect(pro!.servicesOffered).to(equal("Flooring & Carpet, Tile"))
                                        expect(pro!.specialty).to(equal("Additions & Remodeling"))
                                        expect(pro!.primaryLocation).to(equal("Henderson, CO"))
                                        expect(pro!.email).to(equal("contact@summitpresllc.biz"))
                                }

                                context("when there is no entity id") {
                                        it("returns nil") {
                                                // Arrange
                                                let testJson = self.invalidJson

                                                // Act
                                                let result = Pro(fromJson: testJson)

                                                // Assert
                                                expect(result).to(beNil())
                                        }
                                }

                                context("when there is an empty entity id") {
                                        it("returns nil") {
                                                // Arrange
                                                let testJson = self.invalidIdJson

                                                // Act
                                                let result = Pro(fromJson: testJson)

                                                // Assert
                                                expect(result).to(beNil())
                                        }
                                }
                        }

                        describe("when initialized from an array of json") {
                                it("returns an array of valid pro objects") {
                                        // Arrange
                                        let testJsonArray = self.jsonArray

                                        // Act
                                        let pros = Pro.pros(fromJsonArray: testJsonArray)

                                        // Assert
                                        expect(pros).to(haveCount(2))
                                }
                        }
                }
        }
} // swiftlint:disable:next file_length
