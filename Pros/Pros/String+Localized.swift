import Foundation

extension String {
        var localized: String {
                return Localizator.sharedInstance.localize(string: self)
        }
}

private class Localizator {

        static let sharedInstance = Localizator()

        lazy var localizableInfo: [String: Any] = {
                guard let path = Bundle.main.path(forResource: "Localizable", ofType: "plist"),
                        let dictionary = NSDictionary(contentsOfFile: path) as? [ String: Any ]
                        else {
                                fatalError("Localizable file NOT found")
                }

                return dictionary
        }()

        func localize(string: String) -> String {
                guard let localizedInfo =  localizableInfo[string] as? [ String: Any ],
                        let localizedString = localizedInfo["value"] as? String else {
                                assertionFailure("Missing translation for: \(string)")
                                return ""
                }

                return localizedString
        }
}
