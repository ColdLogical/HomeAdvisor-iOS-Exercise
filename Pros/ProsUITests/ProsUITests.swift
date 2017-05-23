import XCTest

class ProsUITests: XCTestCase {
        var app = XCUIApplication()

        override func setUp() {
                super.setUp()
                continueAfterFailure = false
                app.launch()
        }

        override func tearDown() {
                super.tearDown()
        }

        func testProsListUI() {
                proListUITestsShouldPass()
                proDetailsUITestsShouldPass()
        }
}
