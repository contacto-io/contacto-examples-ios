import UIKit

protocol CustomerServiceUsable {
    func loadChatWiget(with info: ChatInfo,
                       navigationController: UINavigationController,
                       delegate: CustomerServiceDelegate)
}
