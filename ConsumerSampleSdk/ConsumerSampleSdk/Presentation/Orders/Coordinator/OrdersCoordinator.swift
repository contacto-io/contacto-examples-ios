class OrdersCoordinator: Coordinator {
    private let router: Router
    private let coordinatorFactory: CoordinatorFactoryType
    var ordersScene: OrdersViewController
    var customerServiceScene: CustomerServiceViewController?
    var configurationScene: ConfigurationsViewController?
    init(router: Router, coordinatorFactory: CoordinatorFactoryType) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        ordersScene = OrdersViewController()
    }
    
    override func start() {
        loadOrders()
    }
    
    override func resume() {
        start()
    }
    
    private func loadOrders() {
        guard ordersScene.viewModel == nil else {
            router.setRootModule(ordersScene)
            return
        }
        let viewModel = OrdersViewModel()
        ordersScene.viewModel = viewModel
        router.setRootModule(ordersScene)
    }
}
