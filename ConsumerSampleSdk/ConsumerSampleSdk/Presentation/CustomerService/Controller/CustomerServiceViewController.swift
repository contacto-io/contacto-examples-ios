import UIKit

class CustomerServiceViewController: UIViewController {
    var viewModel: ServiceVMPresentable?
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Customer Service"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var serviceTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(hexString: "#FBFAFD")
        return tableView
    }()
    
    lazy var activeHeaderView: CustomerServiceHeader = {
        let view = CustomerServiceHeader()
        view.backgroundColor = UIColor(hexString: "#FBFAFD")
        view.titleLabel.text = "Active Conversations"
        return view
    }()
    
    lazy var mostSearchedHeaderView: CustomerServiceHeader = {
        let view = CustomerServiceHeader()
        view.backgroundColor = UIColor(hexString: "#FBFAFD")
        view.titleLabel.text = "Most searched queries"
        return view
    }()
    
    lazy var chatButton: UIButton = {
        let button = UIButton()
        button.setTitle("Chat with us", for: .normal)
        button.setImage(UIImage(named: "Chat")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.imageView?.tintColor = .orange
        button.setTitleColor(.orange, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.orange.cgColor
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        button.addTarget(self, action: #selector(handleChat), for: .touchUpInside)
        return button
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
            self.serviceTableView.reloadData()
        }
    }
    
    @objc private func handleBack() {
        viewModel?.handleBack()
   }
    
    @objc func handleChat() {
        viewModel?.loadChat(navigation: navigationController!)
    }
}
