import Nimble
import Quick

@testable import Pros

 // swiftlint:disable:next type_body_length
class ProDetailsViewSpec: QuickSpec {
        // swiftlint:disable:next function_body_length
        override func spec() {
                var view: ProDetailsView!

                var presenterMock: ProDetailsViewToPresenterInterfaceMock!

                describe("a ProDetails view") {
                        beforeEach {
                                let sb = ProDetailsWireframe.storyboard()
                                view = (sb.instantiateViewController(withIdentifier: ProDetailsConstants.viewIdentifier) as? ProDetailsView)!
                                presenterMock = ProDetailsViewToPresenterInterfaceMock()

                                _ = view.view

                                view.presenter = presenterMock
                        }

                        // MARK: - Operational

                        // MARK: - Presenter to View Interface

                }
        }
}
// swiftlint:disable:this file_length
