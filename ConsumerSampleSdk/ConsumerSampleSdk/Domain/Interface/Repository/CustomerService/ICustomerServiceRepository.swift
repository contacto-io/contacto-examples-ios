import UIKit

protocol ICustomerServiceRepository {
    func loadChatWiget(with info: ChatInfo,
                       navigationController: UINavigationController)
    var delegate: CustomerServiceDelegate? { get set }
}
