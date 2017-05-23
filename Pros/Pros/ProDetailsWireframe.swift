import UIKit

class ProDetailsWireframe {
        // MARK: - VIPER Stack
        lazy var moduleInteractor = ProDetailsInteractor()
        lazy var modulePresenter = ProDetailsPresenter()
        lazy var moduleView: ProDetailsView = {
                let sb = ProDetailsWireframe.storyboard()
                let vc = (sb.instantiateViewController(withIdentifier: ProDetailsConstants.viewIdentifier) as? ProDetailsView)!
                _ = vc.view
                return vc
        }()

        // MARK: - Computed VIPER Variables
        lazy var presenter: ProDetailsWireframeToPresenterInterface = self.modulePresenter
        lazy var view: ProDetailsNavigationInterface = self.moduleView

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
                return UIStoryboard(name: ProDetailsConstants.storyboardIdentifier,
                                    bundle: Bundle(for: ProDetailsWireframe.self))
    	}

        // MARK: - Operational

}

// MARK: - Module Interface
extension ProDetailsWireframe: ProDetails {
        func present(onNavigationController navigationController: UINavigationController,
                     withPro pro: Pro) {
                navigationController.present(moduleView, animated: true, completion: nil)
                presenter.beganPresenting(pro: pro)
        }
}

// MARK: - Presenter to Wireframe Interface
extension ProDetailsWireframe: ProDetailsPresenterToWireframeInterface {

}
