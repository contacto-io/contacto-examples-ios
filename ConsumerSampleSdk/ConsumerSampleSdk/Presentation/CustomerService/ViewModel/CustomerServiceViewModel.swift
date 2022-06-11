import UIKit

class CustomerServiceViewModel: ServiceVMPresentable {
    var activeDataSource: [ActiveConversationsInfo] = []
    
    var mostSearchedDataSource: [MostSearchedInfo] = []
    
    var reloadTable: (() -> Void)?
    var moveToBack: EmptyClosure?
    let useCase: CustomerServiceUsable
    init(useCase: CustomerServiceUsable = CustomerServiceUsecase()) {
        self.useCase = useCase
    }
    func viewDidLoad() {
        generateDataSource()
    }
    
    private func generateDataSource() {
        activeDataSource = [
            ActiveConversationsInfo(title: "I have a payment related query", orderInfo: "Order #2348394783872", timeInfo: "few seconds ago"),
            ActiveConversationsInfo(title: "I have a order related query", orderInfo: "Order #2348394343872", timeInfo: "3 mins ago"),
        ]
        mostSearchedDataSource = [
            MostSearchedInfo(title: "Order related queries"),
            MostSearchedInfo(title: "Payment related queries"),
            MostSearchedInfo(title: "Address related queries")
            
        ]
        reloadTable?()
    }
    
    func numberOfSections() -> Int {
        return 2
    }
    
    func numberOfItems(in section: Int) -> Int {
        guard let serviceType = CustomerServiceType(rawValue: section) else { return 0 }
        switch serviceType {
        case .active:
            return activeDataSource.count
        case .mostSearched:
            return mostSearchedDataSource.count
        }
    }
    
    func handleBack() {
        moveToBack?()
    }
    
    func loadChat(navigation: UINavigationController) {
        useCase.loadChatWiget(navigationController: navigation,
                              delegate: self)
    }
}

extension CustomerServiceViewModel: CustomerServiceDelegate {
    func customerService(didFailToLoadChat withError: CustomerServiceChatError) {
        print("error", withError)
    }
}
