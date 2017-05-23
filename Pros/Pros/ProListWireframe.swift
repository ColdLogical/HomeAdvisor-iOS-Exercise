import UIKit

class ProListWireframe {
        // MARK: - VIPER Stack
        lazy var moduleInteractor = ProListInteractor()
        lazy var moduleNavigationController: UINavigationController = {
                let sb = ProListWireframe.storyboard()
                let nc = (sb.instantiateViewController(withIdentifier: ProListConstants.navigationControllerIdentifier) as? UINavigationController)!
                return nc
        }()
        lazy var modulePresenter = ProListPresenter()
        lazy var moduleView: ProListView = {
                let vc = (self.moduleNavigationController.viewControllers[0] as? ProListView)!
                _ = vc.view
                return vc
        }()

        // MARK: - Computed VIPER Variables
        lazy var presenter: ProListWireframeToPresenterInterface = self.modulePresenter
        lazy var view: ProListNavigationInterface = self.moduleView

        // MARK: - Instance Variables

        // MARK: - Initialization
        init() {
                let i = moduleInteractor
                let p = modulePresenter
                let v = moduleView

                i.presenter = p

                p.interactor = i
                p.view = v
                p.wireframe = self

                v.presenter = p
        }

    	class func storyboard() -> UIStoryboard {
                return UIStoryboard(name: ProListConstants.storyboardIdentifier,
                                    bundle: Bundle(for: ProListWireframe.self))
    	}

        // MARK: - Operational

}

// MARK: - Module Interface
extension ProListWireframe: ProList {
        func present(inWindow window: UIWindow) {
                window.rootViewController = moduleNavigationController
                presenter.beganPresenting()
        }
}

// MARK: - Presenter to Wireframe Interface
extension ProListWireframe: ProListPresenterToWireframeInterface {

}
