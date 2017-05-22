import UIKit

class ProListView: UITableViewController {
        // MARK: - VIPER Stack
        weak var presenter: ProListViewToPresenterInterface!

        // MARK: - Instance Variables

        // MARK: - Outlets

        // MARK: - Operational
        override func awakeFromNib() {
                navigationItem.title = "list.title".localized
        }

}

// MARK: - Navigation Interface
extension ProListView: ProListNavigationInterface { }

// MARK: - Presenter to View Interface
extension ProListView: ProListPresenterToViewInterface {
        
}

// MARK: - UITableView Datasource
extension ProListView {

}

// MARK: - UITableView Delegate
extension ProListView {
        
}
