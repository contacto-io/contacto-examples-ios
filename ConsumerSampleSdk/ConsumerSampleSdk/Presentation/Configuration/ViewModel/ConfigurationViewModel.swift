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
    
    func updateChatConfiguration(with appId: String, and appKey: String) {
        let userInfo = UserDefaults.standard.userInfo
        contacto.initConatactSDK(with: ContactoInitInfo(appInfo: .init(appId: appId,
                                                                       appKey: appKey),
                                                        userInfo: .init(mobileNumber: userInfo.phoneNumber,
                                                                        email: userInfo.email,
                                                                        firstName: userInfo.firstName,
                                                                        lastName: userInfo.lastName)))
        
        UserDefaults.standard.contactoInitInfo = .init(appId: appId,
                                               appKey: appKey)
    }
    
    func handleBack() {
        moveToBack?()
    }
}
