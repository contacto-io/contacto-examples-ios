import UIKit

class CoordinatorFactory: CoordinatorFactoryType {
    func makeMainTabCoordinator(window: UIWindow, coordinatorFactory: CoordinatorFactoryType) -> Coordinator {
        return MainTabBarCoordinator(window: window, coordinatorFactory: coordinatorFactory)
    }
    
    func makeSettingsCoordinator(router: Router, coordinatorFactory: CoordinatorFactoryType) -> Coordinator {
        return SettingsCoordinator(router: router,
                                   coordinatorFactory: coordinatorFactory)
    }
    
    func loadOrders(router: Router, coordinatorFactory: CoordinatorFactoryType) -> Coordinator {
        return OrdersCoordinator(router: router,
                                 coordinatorFactory: coordinatorFactory)
    }
}
