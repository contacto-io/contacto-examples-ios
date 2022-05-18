import UIKit

class OrdersViewModel: OrdersVMPresentable {
    var dataSource: [OrderInfo] = []
    
    var reloadTable: (() -> Void)?
    
    let useCase: CustomerServiceUsable
    init(useCase: CustomerServiceUsable = CustomerServiceUsecase()) {
        self.useCase = useCase
    }
    
    func viewDidLoad() {
        generateDataSource()
    }
    
    func numberOfItems(in section: Int) -> Int {
        return dataSource.count
    }
    
    private func generateDataSource() {
        let firstProduct = OrderInfo(orderInfo: "Order #542763547632",
                                     timeInfo: "1 day ago",
                                     p1eTitle: "Decorative plant 1",
                                     p1Price: "$50",
                                     p1Qty: "x2",
                                     p1Image: "p1Image",
                                     p2eTitle: "Decorative plant 2",
                                     p2Price: "$20",
                                     p2Qty: "x1",
                                     p2Image: "p2Image")
        let secondProduct = OrderInfo(orderInfo: "Order #23463547632",
                                     timeInfo: "1 day ago",
                                     p1eTitle: "Decorative plant 1",
                                     p1Price: "$50",
                                     p1Qty: "x2",
                                     p1Image: "p1Image",
                                     p2eTitle: "Decorative plant 2",
                                     p2Price: "$20",
                                     p2Qty: "x1",
                                     p2Image: "p2Image")
        dataSource = [firstProduct, secondProduct]
        reloadTable?()
        
    }

    func loadChat(navigation: UINavigationController) {
        useCase.loadChatWiget(with: UserDefaults.standard.contactoInitInfo, navigationController: navigation,
                              delegate: self)
    }

}

extension OrdersViewModel: CustomerServiceDelegate {
    func customerService(didFailToLoadChat withError: CustomerServiceChatError) {}
}
