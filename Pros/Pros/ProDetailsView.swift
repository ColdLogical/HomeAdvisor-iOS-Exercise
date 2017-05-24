import UIKit

class ProDetailsView: UIViewController {
        // MARK: - VIPER Stack
        weak var presenter: ProDetailsViewToPresenterInterface!

        // MARK: - Instance Variables
        var proDetailsViewObject: ProDetailsViewObject? {
                didSet {
                        guard let vo = proDetailsViewObject else {
                                return
                        }

                        companyNameLabel?.text = vo.name
                        locationLabel?.text = vo.location
                        overviewTextView?.text = vo.overview
                        servicesLabel?.text = vo.services ?? "details.no-services".localized
                        specialtyLabel?.text = vo.specialty

                        updateRating()
                }
        }

        // MARK: - Outlets
        @IBOutlet var callButton: UIButton!
        @IBOutlet var companyNameLabel: UILabel!
        @IBOutlet var emailButton: UIButton!
        @IBOutlet var locationLabel: UILabel!
        @IBOutlet var overviewTextView: UITextView!
        @IBOutlet var ratingLabel: UILabel!
        @IBOutlet var servicesLabel: UILabel!
        @IBOutlet var specialtyLabel: UILabel!

        // MARK: - Operational
        func updateRating() {
                var ratingText: String = "details.references-available".localized

                if let vo = proDetailsViewObject,
                        let ratingString = vo.rating,
                        let ratingCountString = vo.numberOfRatings,
                        let ratingCount = Int(ratingCountString),
                        ratingCount > 0 {

                        ratingText = String(format: "details.rating.format".localized, ratingString)
                        ratingText += " | "
                        ratingText += String(format: "details.rating-count.format".localized, ratingCountString)
                }

                ratingLabel?.text = ratingText
        }

        override func viewDidLoad() {
                navigationItem.title = "details.title".localized
                callButton?.setTitle("details.button.call.title".localized, for: UIControlState.normal)
                emailButton?.setTitle("details.button.email.title".localized, for: UIControlState.normal)
        }

        // MARK: - Actions
        @IBAction func callTapped(sender: Any) {
                let phoneNumberString: String

                if let phoneNumber = proDetailsViewObject?.phoneNumber {
                        phoneNumberString = phoneNumber
                } else {
                        phoneNumberString = "details.no-phone-number".localized
                }

                print("phone = <\(phoneNumberString)>")
        }

        @IBAction func emailTapped(sender: Any) {
                let emailString: String

                if let email = proDetailsViewObject?.email {
                        emailString = email
                } else {
                        emailString = "details.no-email".localized
                }

                print("email = <\(emailString)>")
        }
}

// MARK: - Navigation Interface
extension ProDetailsView: ProDetailsNavigationInterface { }

// MARK: - Presenter to View Interface
extension ProDetailsView: ProDetailsPresenterToViewInterface {
        func show(proDetails viewObject: ProDetailsViewObject) {
                proDetailsViewObject = viewObject
        }
}
