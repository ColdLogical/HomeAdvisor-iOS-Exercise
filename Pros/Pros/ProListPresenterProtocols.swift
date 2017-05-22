// VIPER Interface to the Module
protocol ProListDelegate: class {

}

// VIPER Interface for communication from Interactor -> Presenter
protocol ProListInteractorToPresenterInterface: class {

}

// VIPER Interface for communication from View -> Presenter
protocol ProListViewToPresenterInterface: class {

}

// VIPER Interface for communication from Wireframe -> Presenter
protocol ProListWireframeToPresenterInterface: class {
        weak var delegate: ProListDelegate? { get }
        func set(delegate newDelegate: ProListDelegate?)

        func beganPresenting()
}
