import Foundation

class ProDetailsPresenter {
        // MARK: - VIPER Stack
        weak var interactor: ProDetailsPresenterToInteractorInterface!
        weak var view: ProDetailsPresenterToViewInterface!
        weak var wireframe: ProDetailsPresenterToWireframeInterface!

        // MARK: - Instance Variables

        // MARK: - Operational

}

// MARK: - Interactor to Presenter Interface
extension ProDetailsPresenter: ProDetailsInteractorToPresenterInterface {

}

// MARK: - View to Presenter Interface
extension ProDetailsPresenter: ProDetailsViewToPresenterInterface {

}

// MARK: - Wireframe to Presenter Interface
extension ProDetailsPresenter: ProDetailsWireframeToPresenterInterface {

}
