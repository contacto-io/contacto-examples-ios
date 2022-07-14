import UIKit

class SettingsViewController: UIViewController {
    
    var viewModel: SettingsVMPresentable?
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Alex Nikiforov"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "alex@example.com"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    lazy var settingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(hexString: "#FBFAFD")
        return tableView
    }()

    lazy var numberLabel: UILabel = {
           let label = UILabel()
           label.text = "919986486551"
           label.textColor = .lightGray
           label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
           label.textAlignment = .center
           return label
       }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        binder()
        viewModel?.viewDidLoad()
    }
    
    private func binder() {
        guard var viewModel = viewModel else { return }
        viewModel.reloadTableView = { [weak self] in
            guard let self = self else { return }
            self.settingsTableView.reloadData()
        }
    }
}
