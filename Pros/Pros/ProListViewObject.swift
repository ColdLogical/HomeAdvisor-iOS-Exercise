struct ProListViewObject {
        // MARK: - Identifier
        let entityId: String

        // MARK: - Instance Variables
        var name: String?
        var numberOfRatings: String?
        var rating: String?

        // MARK: - Initialization
        init(fromPro pro: Pro) {
                entityId = pro.entityId
                name = pro.companyName
                numberOfRatings = pro.ratingCount
                rating = pro.compositeRating
        }
}
