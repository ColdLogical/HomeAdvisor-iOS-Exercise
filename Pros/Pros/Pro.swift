import SwiftyJSON

struct Pro {
        // MARK: - Identifier
        let entityId: String

        // MARK: - Instance VAriables
        var canadianSP: Bool = false
        var companyName: String?
        var companyOverview: String?
        var compositeRating: String?
        var email: String?
        var latitude: Float?
        var longitude: Float?
        var phoneNumber: String?
        var primaryLocation: String?
        var ratingCount: String?
        var servicesOffered: String?
        var spanishSpeaking: Bool = false
        var specialty: String?

        // MARK: - Intialization
        init(withEntityId identifier: String) {
                entityId = identifier
        }

        init?(fromJson jsonDictionary: [String: Any]) {
                let json = JSON(jsonDictionary)
                let identifier = json["entityId"].stringValue
                guard identifier != "" else {
                        return nil
                }

                self.init(withEntityId: identifier)

                canadianSP = json["canadianSP"].boolValue
                companyName = json["companyName"].string
                companyOverview = json["companyOverview"].string
                compositeRating = json["compositeRating"].string
                email = json["email"].string
                latitude = json["latitude"].float
                longitude = json["longitude"].float
                phoneNumber = json["phoneNumber"].string
                primaryLocation = json["primaryLocation"].string
                ratingCount = json["ratingCount"].string
                servicesOffered = json["servicesOffered"].string
                spanishSpeaking = json["spanishSpeaking"].boolValue
                specialty = json["specialty"].string
        }

        static func pros(fromJsonArray jsonArray: [ [String: Any] ]) -> [Pro] {
                var pros = [Pro]()

                for jsonDictionary in jsonArray {
                        if let pro = Pro(fromJson: jsonDictionary) {
                                pros.append(pro)
                        }
                }

                return pros
        }
}
