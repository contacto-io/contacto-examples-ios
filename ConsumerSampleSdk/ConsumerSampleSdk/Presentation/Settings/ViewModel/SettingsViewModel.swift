import Foundation
import ContactoSDK

class SettingsViewModel: SettingsVMPresentable {
    var datasources: [SettingsItems]?
    var reloadTableView: (() -> Void)?
    var routeToCustomerService: EmptyClosure?
    var routeToConfiguration: EmptyClosure?
    private let contacto: Contacto
    
    init(contacto: Contacto = Contacto()) {
        self.contacto = contacto
    }
    
    func viewDidLoad() {
        setupDataSourceAndReload()
    }
    
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

    func updateUserInfo(userInfo: UserInfo) {
        let chatInfo = UserDefaults.standard.contactoInitInfo
        contacto.initConatactSDK(with: ContactoInitInfo(appInfo: .init(appId: chatInfo.appId,
                                                                       appKey: chatInfo.appKey),
                                                        userInfo: .init(mobileNumber: userInfo.phoneNumber,
                                                                        email: userInfo.email,
                                                                        firstName: userInfo.firstName,
                                                                        lastName: userInfo.lastName)))
        UserDefaults.standard.userInfo = userInfo
    }
}
