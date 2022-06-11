import UIKit

protocol ICustomerServiceRepository {
    func loadChatWiget(navigationController: UINavigationController)
    var delegate: CustomerServiceDelegate? { get set }
}
