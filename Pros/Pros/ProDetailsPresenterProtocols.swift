// VIPER Interface for communication from Interactor -> Presenter
protocol ProDetailsInteractorToPresenterInterface: class {

}

// VIPER Interface for communication from View -> Presenter
protocol ProDetailsViewToPresenterInterface: class {

}

// VIPER Interface for communication from Wireframe -> Presenter
protocol ProDetailsWireframeToPresenterInterface: class {
        func beganPresenting(pro: Pro)
}
