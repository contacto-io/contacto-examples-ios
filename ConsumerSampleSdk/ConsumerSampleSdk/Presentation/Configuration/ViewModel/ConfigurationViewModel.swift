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
        let name = getFirstAndLastName(name: userInfo.name)
        contacto.initConatactSDK(with: ContactoInitInfo(appInfo: .init(appId: appId,
                                                                       appKey: appKey),
                                                        userInfo: .init(mobileNumber: userInfo.phoneNumber,
                                                                        email: userInfo.email,
                                                                        firstName: name.0,
                                                                        lastName: name.1)))
        
        UserDefaults.standard.contactoInitInfo = .init(appId: appId,
                                                       appKey: appKey)
    }
    
    private func getFirstAndLastName(name: String) -> (String, String) {
        var components = name.components(separatedBy: " ")
        if !components.isEmpty {
            let firstName = components.removeFirst()
            let lastName = components.joined(separator: " ")
            return (firstName, lastName)
        }
        return ("", "")
    }
    
    func handleBack() {
        moveToBack?()
    }
}
