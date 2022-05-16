import UIKit

class CustomerServiceUsecase: CustomerServiceUsable {
    var repository: ICustomerServiceRepository
    init(repository: ICustomerServiceRepository = CustomerServiceRepository()) {
        self.repository = repository
    }
    func loadChatWiget(with info: ChatInfo, navigationController: UINavigationController,
                       delegate: CustomerServiceDelegate) {
        repository.delegate = delegate
        repository.loadChatWiget(with: info,
                                 navigationController: navigationController)
    }

}
