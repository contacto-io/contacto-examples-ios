import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    lazy var applicationCoordinator: Coordinator = self.makeCoordinator()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        applicationCoordinator.start()
        return true
    }
    
    private func makeCoordinator() -> Coordinator {
        window = UIWindow(frame: UIScreen.main.bounds)
        let appCoordinator = ApplicationCoordinator(coordinatorFactory: CoordinatorFactory(),
                                                    window: window!)
        return appCoordinator
    }
}
