class SettingsViewModel: SettingsVMPresentable {
    var datasources: [SettingsItems]?
    
    var reloadTableView: (() -> Void)?
    
    func viewDidLoad() {
        setupDataSourceAndReload()
    }

    var routeToCustomerService: EmptyClosure?
    var routeToConfiguration: EmptyClosure?
    
    private func setupDataSourceAndReload() {
        datasources = []
        datasources?.append(.customerService)
        datasources?.append(.configuration)
        reloadTableView?()
    }
    
    func moveToCustomerService() {
        routeToCustomerService?()
    }
    
    func moveToConfiguration() {
        routeToConfiguration?()
    }
}
