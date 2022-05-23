import UIKit
import ContactoSDK

class CustomerServiceRepository: ICustomerServiceRepository {
    var contacto: Contacto
    
    weak var delegate: CustomerServiceDelegate?
    init(contacto: Contacto = Contacto()) {
        self.contacto = contacto
    }
    
    func loadChatWiget(with info: ChatInfo,
                       navigationController: UINavigationController) {
        let appInfo = ContactoSessionInfo(appId: info.appId, appKey: info.appKey)
        let userInfo = ContactoUserInfo(mobileNumber: info.mobileNumber, email: info.email)
        let contactoInitInfo = ContactoInitInfo(appInfo: appInfo,
                                                userInfo: userInfo)
        contacto.loadChatWidget(with: contactoInitInfo,
                                navigationController: navigationController,
                                navigation: .init(position: .pushOnExistingModule),
                                delegate: self)
    }
    
}
extension CustomerServiceRepository: ContactoDelegate {
    func contacto(didFailToLoadChat withError: ContactoError) {
        delegate?.customerService(didFailToLoadChat: getCustomerServiceError(from: withError))
    }
    
    private func getCustomerServiceError(from: ContactoError) -> CustomerServiceChatError {
        switch from {
        
        case .noInternet:
            return .noInternet
        case .loadingError(let message):
            return .loadingError(message)
        case .initialisationError:
            return .initialisationError
        }
    }
}
