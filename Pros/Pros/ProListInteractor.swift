import Foundation

class ProListInteractor {
        // MARK: - VIPER Stack
        weak var presenter: ProListInteractorToPresenterInterface!

        // MARK: - Instance Variables
        var prosService: ProsService = ProsServiceImplementation()

        // MARK: - Operational
        func failedProFetch(withError error: Error) {
                presenter.failedGettingPros(withError: error)
        }

        func fetched(pros: [Pro]) {
                presenter.successGetting(pros: pros)
        }
}

// MARK: - Presenter To Interactor Interface
extension ProListInteractor: ProListPresenterToInteractorInterface {
        func getPros() {
                prosService.fetchPros(success: fetched(pros:),
                                      failure: failedProFetch(withError:))
        }
}
