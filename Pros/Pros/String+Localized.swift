import Foundation

extension String {
        var localized: String {
                return Localizer.shared.localize(string: self)
        }
}

private class Localizer {

        static let shared = Localizer()

        lazy var localizableInfo: [String: Any] = {
                guard let path = Bundle.main.path(forResource: "Localizable", ofType: "plist"),
                        let dictionary = NSDictionary(contentsOfFile: path) as? [ String: Any ]
                        else {
                                fatalError("Localizable file NOT found")
                }

                return dictionary
        }()

        func localize(string: String,
                      locale: Locale = Locale.current) -> String {
                guard let localizedInfo =  localizableInfo[string] as? [ String: Any ],
                        let localizedValues = localizedInfo["values"] as? [ String: String ],
                        let localizedString = localizedValues[locale.identifier] else {
                                assertionFailure("Missing translation for: \(string)")
                                return ""
                }

                return localizedString
        }
}
