import UIKit

class ApplicationCoordinator: Coordinator {
    private let coordinatorFactory: CoordinatorFactoryType
    private let window: UIWindow
    
    init(coordinatorFactory: CoordinatorFactoryType, window: UIWindow) {
        self.coordinatorFactory = coordinatorFactory
        self.window = window
    }
    
    override func start() {
        loadMainTabBarScene()
    }
    
    func loadMainTabBarScene() {
        let coordinator = coordinatorFactory.makeMainTabCoordinator(window: window, coordinatorFactory: coordinatorFactory)
        coordinator.start()
    }
}
