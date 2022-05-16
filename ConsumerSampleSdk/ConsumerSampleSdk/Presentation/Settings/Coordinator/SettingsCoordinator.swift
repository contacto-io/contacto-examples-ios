class SettingsCoordinator: Coordinator {
    private let router: Router
    private let coordinatorFactory: CoordinatorFactoryType
    var settingsScene: SettingsViewController
    var customerServiceScene: CustomerServiceViewController?
    var configurationScene: ConfigurationsViewController?
    init(router: Router, coordinatorFactory: CoordinatorFactoryType) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        settingsScene = SettingsViewController()
    }
    
    override func start() {
        loadSettings()
    }
    
    override func resume() {
        start()
    }
    
    private func loadSettings() {
        guard settingsScene.viewModel == nil else {
            router.setRootModule(settingsScene)
            return
        }
        let viewModel = SettingsViewModel()
        viewModel.routeToCustomerService = { [weak self] in
            guard let self = self else { return }
            self.routeToCustomerService()
        }
        
        viewModel.routeToConfiguration = { [weak self] in
            guard let self = self else { return }
            self.routeToConfuguration()
        }
        settingsScene.viewModel = viewModel
        router.setRootModule(settingsScene)
    }
    
    func routeToCustomerService() {
        let viewModel = CustomerServiceViewModel()
        viewModel.moveToBack = { [weak self] in
            guard let self = self else { return }
            self.router.popModule()
        }
        customerServiceScene = CustomerServiceViewController()
        customerServiceScene?.viewModel = viewModel
        router.push(customerServiceScene, animated: true)
    }
    
    func routeToConfuguration() {
        let viewModel = ConfigurationViewModel()
        viewModel.moveToBack = { [weak self] in
            guard let self = self else { return }
            self.router.popModule()
        }
        configurationScene = ConfigurationsViewController()
        configurationScene?.viewModel = viewModel
        router.push(configurationScene, animated: true)
    }
}
