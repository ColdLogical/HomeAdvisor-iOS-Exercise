import UIKit

class ProDetailsView: UIViewController {
        // MARK: - VIPER Stack
        weak var presenter: ProDetailsViewToPresenterInterface!

        // MARK: - Instance Variables

        // MARK: - Outlets

        // MARK: - Operational

}

// MARK: - Navigation Interface
extension ProDetailsView: ProDetailsNavigationInterface { }

// MARK: - Presenter to View Interface
extension ProDetailsView: ProDetailsPresenterToViewInterface {

}
