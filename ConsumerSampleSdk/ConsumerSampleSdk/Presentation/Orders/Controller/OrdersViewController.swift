import UIKit

class OrdersViewController: UIViewController {
    var viewModel: OrdersVMPresentable?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "My Orders"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var ordersTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(hexString: "#FBFAFD")
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        binder()
        viewModel?.viewDidLoad()
    }
    
    private func binder() {
        guard var viewModel = viewModel else { return }
        viewModel.reloadTable = { [weak self] in
            guard let self = self else { return }
            self.ordersTableView.reloadData()
        }
    }
}
