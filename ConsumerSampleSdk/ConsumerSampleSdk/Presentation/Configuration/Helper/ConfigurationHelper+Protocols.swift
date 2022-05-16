protocol ConfigurationVMPresentable {
    var datasource: [ConfigurationInfo] { get set }
    var reloadTable: (() -> Void)? { get set }
    var chatId: String? { get set }
    var chatKey: String? { get set }
    func getAllConfigurations()
    func updateChatConfiguration(with chatId: String, and chatKey: String)
    func handleBack()
}
