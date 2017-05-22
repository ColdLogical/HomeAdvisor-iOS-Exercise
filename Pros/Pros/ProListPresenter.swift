import Foundation

class ProListPresenter {
        // MARK: - VIPER Stack
        weak var interactor: ProListPresenterToInteractorInterface!
        weak var view: ProListPresenterToViewInterface!
        weak var wireframe: ProListPresenterToWireframeInterface!

        // MARK: - Instance Variables
        weak var delegate: ProListDelegate?
        var moduleWireframe: ProList {
                get {
                        let mw = (self.wireframe as? ProList)!
                        return mw
                }
        }

        // MARK: - Operational

}

// MARK: - Interactor to Presenter Interface
extension ProListPresenter: ProListInteractorToPresenterInterface {

}

// MARK: - View to Presenter Interface
extension ProListPresenter: ProListViewToPresenterInterface {

}

// MARK: - Wireframe to Presenter Interface
extension ProListPresenter: ProListWireframeToPresenterInterface {
        func set(delegate newDelegate: ProListDelegate?) {
                delegate = newDelegate
        }

        func beganPresenting() {

        }
}
