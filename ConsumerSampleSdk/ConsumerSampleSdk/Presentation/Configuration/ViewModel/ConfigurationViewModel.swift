import Foundation
import ContactoSDK

class ConfigurationViewModel: ConfigurationVMPresentable {
    var datasource: [ConfigurationInfo] = []
    var chatId: String?
    var chatKey: String?
    var reloadTable: (() -> Void)?
    private let contacto: Contacto

    init(contacto: Contacto = Contacto()) {
        self.contacto = contacto
    }
    var moveToBack: EmptyClosure?

    func getAllConfigurations() {
        let configurations = [
            ConfigurationInfo(title: "App ID", actionType: .detail)
        ]
        datasource = configurations
        reloadTable?()
    }
    
    func updateChatConfiguration(with chatId: String, and chatKey: String) {
        contacto.initConatactSDK(with: ContactoInitInfo(appInfo: .init(appId: chatId,
                                                                       appKey: chatKey),
                                                        userInfo: .init(mobileNumber: "919986486551",
                                                                        email: "gprasad@gmail.com")))
        UserDefaults.standard.contactoInitInfo = .init(appId: chatId,
                                                       appKey: chatKey,
                                                       mobileNumber: "919986486551",
                                                       email: "gprasad@gmail.com")
    }
    
    func handleBack() {
        moveToBack?()
    }
}
