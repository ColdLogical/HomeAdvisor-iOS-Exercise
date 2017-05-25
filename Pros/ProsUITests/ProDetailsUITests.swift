import Nimble
import XCTest

extension ProsUITests {
        func proDetailsUITestsShouldPass() {
                whenAProIsSelected()
                thenShouldHaveTheCorrectTitle()
                thenShouldDisplayTheCompanysDetails()
                thenShouldBeACallButton()
                thenShouldBeAnEmailButton()

                givenBackWasTapped()

                whenAProWithoutServicesIsSelected()
                thenShouldShowNoServicesAvailable()
        }

        // MARK: - Computed Variables
        var fullInfoProCell: XCUIElement {
                return app.tables.cells.element(boundBy: 12)
        }

        var proWithoutServicesCell: XCUIElement {
                return app.tables.cells.element(boundBy: 15)
        }
}

// MARK: - Givens
extension ProsUITests {
        func givenBackWasTapped() {
                let button = app.navigationBars.buttons["Pros"]
                button.tap()
        }
}

// MARK: - Whens
extension ProsUITests {
        func whenAProIsSelected() {
                let cell = fullInfoProCell
                cell.tap()
        }

        func whenAProWithoutServicesIsSelected() {
                let cell = proWithoutServicesCell
                cell.tap()
        }
}

// MARK: - Thens
extension ProsUITests {
        func thenShouldBeACallButton() {
                // Arrange
                let buttons = app.buttons

                // Assert
                expect(buttons["CALL"].exists).to(beTrue())
        }

        func thenShouldBeAnEmailButton() {
                // Arrange
                let buttons = app.buttons

                // Assert
                expect(buttons["EMAIL"].exists).to(beTrue())
        }

        func thenShouldDisplayTheCompanysDetails() {
                // Assert
                let texts = app.staticTexts
                expect(texts["Rocky Mountain Hot Jetting Services, Inc."].exists).to(beTrue())
                expect(texts["Plumbing"].exists).to(beTrue())
                expect(texts["Rating: 4.77 | 8 rating(s)"].exists).to(beTrue())
                expect(texts["Arvada, CO"].exists).to(beTrue())
                expect(texts["Plumbing, Power Washing"].exists).to(beTrue())
                let text = (app.textViews.element.value as? String)!
                let companyOverview = "Fast, complete drain and sewer cleaning, when we leave your lines are COMPLETLY clean.  We offer a 1 year GUARANTEE, if it clogs again we come for free.  Because cabling/snaking a drain only removes a clog and Hot water jetting removes everything in your line, we know once we are done it is clean of all roots, grease, hair, anything in the line.  We have a camera that we use, and we encourage you to watch as we look at your line during the process.  We take great pride in our experience, expertise, quality and customer service that we provide to meet the consumer’s needs. It is our mission to provide excellent workmanship and complete customer satisfaction from start to completion of a project. In order to understand the needs and expectations of our customers, we take great care to work and communicate with every customer in a professional manner. Our reputation is based on service, safety and quality, regardless of how large or small the job." // swiftlint:disable:this line_length
                expect(text == companyOverview).to(beTrue())
        }

        func thenShouldHaveTheCorrectTitle() {
                // Arrange
                let texts = app.staticTexts

                // Assert
                expect(texts["Details"].exists).to(beTrue())
        }

        func thenShouldShowNoServicesAvailable() {
                // Arrange
                let texts = app.staticTexts

                // Assert
                expect(texts["Services Not Available"].exists).to(beTrue())
        }
}
