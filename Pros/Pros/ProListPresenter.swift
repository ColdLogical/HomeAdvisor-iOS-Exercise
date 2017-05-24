import Foundation

class ProListPresenter {
        // MARK: - VIPER Stack
        weak var interactor: ProListPresenterToInteractorInterface!
        weak var view: ProListPresenterToViewInterface!
        weak var wireframe: ProListPresenterToWireframeInterface!

        // MARK: - Instance Variables
        var currentPros: [Pro] = [Pro]()

        // MARK: - Operational

}

// MARK: - Interactor to Presenter Interface
extension ProListPresenter: ProListInteractorToPresenterInterface {
        func failedGettingPros(withError error: Error) {
                let emptyViewObjects = [ProListViewObject]()
                view.show(proListViewObjects: emptyViewObjects)
        }

        func successGetting(pros: [Pro]) {
                currentPros = pros

                var viewObjects = [ProListViewObject]()
                for pro in pros {
                        let viewObject = ProListViewObject(fromPro: pro)
                        viewObjects.append(viewObject)
                }

                view.show(proListViewObjects: viewObjects)
        }
}

// MARK: - View to Presenter Interface
extension ProListPresenter: ProListViewToPresenterInterface {
        func userSelected(proListViewObject: ProListViewObject) {
                guard let pro = currentPros.filter({ $0.entityId == proListViewObject.entityId }).first else {
                        return
                }
                wireframe.presentDetails(forPro: pro)
        }
}

// MARK: - Wireframe to Presenter Interface
extension ProListPresenter: ProListWireframeToPresenterInterface {
        func beganPresenting() {
                interactor.getPros()
        }
}
