// VIPER Interface to the Module
protocol ProListDelegate: class {

}

// VIPER Interface for communication from Interactor -> Presenter
protocol ProListInteractorToPresenterInterface: class {
        func failedGettingPros(withError error: Error)
        func successGetting(pros: [Pro])
}

// VIPER Interface for communication from View -> Presenter
protocol ProListViewToPresenterInterface: class {
        func userSelected(proListViewObject: ProListViewObject)
}

// VIPER Interface for communication from Wireframe -> Presenter
protocol ProListWireframeToPresenterInterface: class {
        func beganPresenting()
}
