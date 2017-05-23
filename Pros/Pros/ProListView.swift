import UIKit

class ProListView: UITableViewController {
        // MARK: - VIPER Stack
        weak var presenter: ProListViewToPresenterInterface!

        // MARK: - Instance Variables
        var proViewObjects = [ProViewObject]()

        // MARK: - Outlets

        // MARK: - Operational
        override func awakeFromNib() {
                navigationItem.title = "list.title".localized
        }

        override func viewDidLoad() {
                tableView.rowHeight = UITableViewAutomaticDimension
                tableView.estimatedRowHeight = 71
        }
}

// MARK: - Navigation Interface
extension ProListView: ProListNavigationInterface { }

// MARK: - Presenter to View Interface
extension ProListView: ProListPresenterToViewInterface {
        func show(proViewObjects: [ProViewObject]) {
                self.proViewObjects = proViewObjects.sorted {
                        guard let firstCompanyName = $0.name else {
                                return true
                        }
                        guard let secondCompanyName = $1.name else {
                                return false
                        }
                        return firstCompanyName.localizedCaseInsensitiveCompare(secondCompanyName) == ComparisonResult.orderedAscending
                }

                tableView.reloadData()
        }
}

// MARK: - UITableView Datasource
extension ProListView {
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: ProCell.identifier, for: indexPath)
                guard let proCell = cell as? ProCell else {
                        return cell
                }

                let viewObject = proViewObjects[indexPath.row]
                proCell.pro = viewObject

                return proCell
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return proViewObjects.count
        }
}

// MARK: - UITableView Delegate
extension ProListView {
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let viewObject = proViewObjects[indexPath.row]
                presenter.userSelected(proViewObject: viewObject)
        }
}
