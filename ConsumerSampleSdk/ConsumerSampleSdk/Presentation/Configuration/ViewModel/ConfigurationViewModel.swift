import Foundation

class ConfigurationViewModel: ConfigurationVMPresentable {
    var datasource: [ConfigurationInfo] = []
    var chatId: String?
    var chatKey: String?
    var reloadTable: (() -> Void)?
    var moveToBack: EmptyClosure?

    func getAllConfigurations() {
        let configurations = [
            ConfigurationInfo(title: "App ID", actionType: .detail),
            ConfigurationInfo(title: "Notifications", actionType: .switch)
        ]
        datasource = configurations
        reloadTable?()
    }
    
    func updateChatConfiguration(with chatId: String, and chatKey: String) {
        UserDefaults.standard.contactoInitInfo = .init(chatId: chatId,
                                                       chatKey: chatKey,
                                                       mobileNumber: "919986486551",
                                                       email: "gprasad@gmail.com")
    }
    
    func handleBack() {
        moveToBack?()
    }
}