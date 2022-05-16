import UIKit

class MainTabBarCoordinator: Coordinator {
    private let window: UIWindow?
    private let coordinatorFactory: CoordinatorFactoryType
    
    init(window: UIWindow, coordinatorFactory: CoordinatorFactoryType) {
        self.window = window
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        loadMainTabBarScreen()
    }

    private func loadMainTabBarScreen() {
        let viewModel = MainTabBarViewModel()
        viewModel.coordinator = self
        let viewController = MainTabBarController()
        viewController.viewModel = viewModel
        viewController.view.backgroundColor = .white
        viewController.initateTabBar()
        viewController.selectedTab = 3
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
    
    func loadSettings(navigation: UINavigationController) {
        if navigation.viewControllers.isEmpty {
            let coordinator = coordinatorFactory.makeSettingsCoordinator(router: Router(rootController: navigation), coordinatorFactory: coordinatorFactory)
            self.addDependency(coordinator)
            coordinator.start()
        } else {
            let coordinator = childCoordinators.first { $0 is SettingsCoordinator }
            coordinator?.resume()
        }
    }
    
    func loadOrders(navigation: UINavigationController) {
        if navigation.viewControllers.isEmpty {
            let coordinator = coordinatorFactory.loadOrders(router: Router(rootController: navigation), coordinatorFactory: coordinatorFactory)
            self.addDependency(coordinator)
            coordinator.start()
        } else {
            let coordinator = childCoordinators.first { $0 is OrdersCoordinator }
            coordinator?.resume()
        }
    }
}
