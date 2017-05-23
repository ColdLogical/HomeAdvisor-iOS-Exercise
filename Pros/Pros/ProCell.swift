import UIKit

class ProCell: UITableViewCell {
        static var identifier = "ProCell"

        // MARK: - IBOutlets
        @IBOutlet var nameLabel: UILabel!
        @IBOutlet var ratingLabel: UILabel!

        var pro: ProViewObject? {
                didSet {
                        updateNameLabel()
                        updateRatingLabel()
                }
        }

        // MARK: - Operational
        func updateNameLabel() {
                guard let pro = pro else {
                        return
                }

                nameLabel.text = pro.name
        }

        func updateRatingLabel() {
                var ratingText: String = "list.references-available".localized
                var color: UIColor = UIColor.black

                guard let pro = pro,
                        let ratingCountString = pro.numberOfRatings,
                        let ratingCount = Int(ratingCountString) else {
                               return
                }

                if ratingCount > 0,
                        let ratingString = pro.rating,
                        let rating = Float(ratingString) {

                        switch rating {
                        case _ where rating < 3.0:
                                color = UIColor.red
                        case 3.0..<4.0:
                                color = UIColor.orange
                        default:
                                color = UIColor.green
                        }

                        ratingText = String(format: "list.rating.format".localized, ratingString)
                        ratingText += " | "
                        ratingText += String(format: "list.rating-count.format".localized, ratingCountString)
                }

                ratingLabel.text = ratingText
                ratingLabel.textColor = color
        }
}
