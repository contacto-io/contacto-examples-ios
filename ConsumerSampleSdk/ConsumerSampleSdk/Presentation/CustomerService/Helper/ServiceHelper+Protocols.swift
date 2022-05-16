import UIKit

protocol ServiceVMPresentable {
    var activeDataSource: [ActiveConversationsInfo] { get set }
    var mostSearchedDataSource: [MostSearchedInfo] { get set }
    var reloadTable: (() -> Void)? { get set }
    func viewDidLoad()
    func numberOfSections() -> Int
    func numberOfItems(in section: Int) -> Int
    func handleBack()
    func loadChat(navigation: UINavigationController)
}

protocol CustomerServiceDelegate: AnyObject {
    func customerService(didFailToLoadChat withError: CustomerServiceChatError)
}
