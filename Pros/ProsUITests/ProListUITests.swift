import Nimble
import XCTest

extension ProsUITests {
        func proListUITestsShouldPass() {
                thenListShouldHaveTheCorrectTitle()
                thenListShouldShowPros()
                thenCellsShouldShowCompanyName()
                thenCellsShouldShowRatings()
        }

        // MARK: - Computed Test Variables
        var cellWithRatings: XCUIElement {
                get {
                        return app.tables.cells.element(boundBy: 0)
                }
        }

        var cellWithoutRatings: XCUIElement {
                get {
                        givenTableHasScolledToTheBottom()
                        return app.tables.cells.element(boundBy: 13)
                }
        }
}

// MARK: - Givens
extension ProsUITests {
        func givenTableHasScolledToTheBottom() {
                let table = app.tables.element(boundBy: 0)
                let lastCell = table.cells.element(boundBy: table.cells.count-1)
                table.scroll(toElement: lastCell)
        }
}

// MARK: - Thens
extension ProsUITests {
        func thenCellsShouldShowCompanyName() {
                // Arrange
                let cell = app.tables.cells.element(boundBy: 0)

                // Assert
                expect(cell.staticTexts["AAA Service Plumbing, Inc."].exists).to(beTrue())
        }

        func thenListShouldHaveTheCorrectTitle() {
                // Arrange
                let texts = app.staticTexts

                // Assert
                expect(texts["Pros"].exists).to(beTrue())
        }

        func thenListShouldShowPros() {
                // Arrange
                let cells = app.tables.cells

                // Assert
                expect(cells.count).to(equal(20))
        }

        // MARK: - Ratings Text Tests
        func thenCellsShouldShowRatings() {
                thenCellsWithRatingsShouldShowRatingAndRatingCount()
                thenCellsWithoutRatingsShouldShowReferencesAvailable()
        }

        func thenCellsWithRatingsShouldShowRatingAndRatingCount() {
                // Arrange
                let cell = cellWithRatings

                // Assert
                expect(cell.staticTexts["Rating: 4.59 | 179 rating(s)"].exists).to(beTrue())
        }

        func thenCellsWithoutRatingsShouldShowReferencesAvailable() {
                // Arrange
                let cell = cellWithoutRatings

                // Assert
                expect(cell.staticTexts["References Available"].exists).to(beTrue())
        }
}
