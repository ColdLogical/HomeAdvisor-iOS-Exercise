struct ProDetailsViewObject {
        // MARK: - Identifier
        let entityId: String

        // MARK: - Instance Variables
        var email: String?
        var location: String?
        var name: String?
        var numberOfRatings: String?
        var overview: String?
        var phoneNumber: String?
        var rating: String?
        var services: String?
        var specialty: String?

        // MARK: - Initialization
        init(fromPro pro: Pro) {
                entityId = pro.entityId

                email = pro.email
                location = pro.primaryLocation
                name = pro.companyName
                numberOfRatings = pro.ratingCount
                overview = pro.companyOverview
                phoneNumber = pro.phoneNumber
                rating = pro.compositeRating
                services = pro.servicesOffered
                specialty = pro.specialty
        }
}
