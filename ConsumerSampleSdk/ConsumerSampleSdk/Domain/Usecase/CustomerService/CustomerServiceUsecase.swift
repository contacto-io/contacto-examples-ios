import UIKit

class CustomerServiceUsecase: CustomerServiceUsable {
    var repository: ICustomerServiceRepository
    init(repository: ICustomerServiceRepository = CustomerServiceRepository()) {
        self.repository = repository
    }
    func loadChatWiget(navigationController: UINavigationController,
                       delegate: CustomerServiceDelegate) {
        repository.delegate = delegate
        repository.loadChatWiget(navigationController: navigationController)
    }
 
}
