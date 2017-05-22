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

                        // MARK: - Presenter to View Interface
                }
        }
}
// swiftlint:disable:this file_length
