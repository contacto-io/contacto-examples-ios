import UIKit
import ContactoSDK

class CustomerServiceRepository: ICustomerServiceRepository {
    let contacto: Contacto
    weak var delegate: CustomerServiceDelegate?
    init(contacto: Contacto = Contacto()) {
        self.contacto = contacto
    }
    
    func loadChatWiget(navigationController: UINavigationController) {
        contacto.loadChatWidget(navigationController: navigationController,
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
