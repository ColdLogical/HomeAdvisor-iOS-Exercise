import Foundation

class ProListPresenter {
        // MARK: - VIPER Stack
        weak var interactor: ProListPresenterToInteractorInterface!
        weak var view: ProListPresenterToViewInterface!
        weak var wireframe: ProListPresenterToWireframeInterface!

        // MARK: - Instance Variables

        // MARK: - Operational

}

// MARK: - Interactor to Presenter Interface
extension ProListPresenter: ProListInteractorToPresenterInterface {
        func failedGettingPros(withError error: Error) {
                let emptyViewObjects = [ProViewObject]()
                view.show(proViewObjects: emptyViewObjects)
        }

        func successGetting(pros: [Pro]) {
                var viewObjects = [ProViewObject]()

                for pro in pros {
                        let viewObject = ProViewObject(fromPro: pro)
                        viewObjects.append(viewObject)
                }

                view.show(proViewObjects: viewObjects)
        }
}

// MARK: - View to Presenter Interface
extension ProListPresenter: ProListViewToPresenterInterface {
        func userSelected(proViewObject: ProViewObject) {

        }
}

// MARK: - Wireframe to Presenter Interface
extension ProListPresenter: ProListWireframeToPresenterInterface {
        func beganPresenting() {
                interactor.getPros()
        }
}
