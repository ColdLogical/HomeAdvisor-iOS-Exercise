// VIPER Interface for manipulating the navigation of the view
protocol ProDetailsNavigationInterface: class {

}

// VIPER Interface for communication from Presenter -> View
protocol ProDetailsPresenterToViewInterface: class {
        func show(proDetails viewObject: ProDetailsViewObject)
}
