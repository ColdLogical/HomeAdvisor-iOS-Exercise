import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

        var window: UIWindow? = {
                let w = UIWindow(frame: UIScreen.main.bounds)
                w.makeKeyAndVisible()
                return w
        }()

        lazy var proList: ProList = ProListWireframe()

        func application(_ application: UIApplication,
                         didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
                // swiftlint:disable:previous line_length
                guard let window = window else {
                        fatalError("Couldn't create a window?")
                }

                proList.present(inWindow: window)

                return true
        }
}
