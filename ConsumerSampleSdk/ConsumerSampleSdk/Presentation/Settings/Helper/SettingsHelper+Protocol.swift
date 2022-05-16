protocol SettingsVMPresentable {
    var datasources: [SettingsItems]? { get set }
    var reloadTableView: (() -> Void)? { get set }
    func viewDidLoad()
    func moveToCustomerService()
    func moveToConfiguration()
}
