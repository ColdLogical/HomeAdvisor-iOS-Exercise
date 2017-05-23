import XCTest

extension XCUIElement {
        func scroll(toElement element: XCUIElement) {
                while !element.visible() {
                        swipeUp()
                }
        }

        func visible() -> Bool {
                guard exists &&
                        !frame.isEmpty else {
                                return false
                }
                return XCUIApplication().windows.element(boundBy: 0).frame.contains(frame)
        }
}
