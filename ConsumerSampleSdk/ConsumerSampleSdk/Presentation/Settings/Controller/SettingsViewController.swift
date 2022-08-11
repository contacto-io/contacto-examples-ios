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

    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "919986486551"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        return label
    }()

    lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemOrange, for: .normal)
        button.setTitle("Edit", for: .normal)
        button.addTarget(self, action: #selector(handleEditProfile), for: .touchUpInside)
        return button
    }()

    lazy var settingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(hexString: "#FBFAFD")
        return tableView
    }()

    lazy var editProfileBottomView: EditProfileView = {
        let view = EditProfileView()
        view.backgroundColor = UIColor.white
        view.cancelButton.addTarget(self, action: #selector(handleBlurTap), for: .touchUpInside)
        view.doneButton.addTarget(self, action: #selector(handleDone), for: .touchUpInside)
        view.phoneTextField.delegate = self
        view.emailTextField.delegate = self
        view.nameTextField.delegate = self
        return view
    }()

    lazy var blurView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        view.isHidden = true
        view.isUserInteractionEnabled = true
        return view
    }()

    let editProfileViewHeight: CGFloat = 420
    var editProfileViewBottomConstants: CGFloat {
        return view.safeAreaInsets.bottom + editProfileViewHeight
    }
    var editProfileViewBottomConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        binder()
        viewModel?.viewDidLoad()
        upateProfileSection()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        editProfileBottomView.roundCorners(corners: [.topLeft, .topRight], radius: 20)
    }
    
    private func binder() {
        guard var viewModel = viewModel else { return }
        viewModel.reloadTableView = { [weak self] in
            guard let self = self else { return }
            self.settingsTableView.reloadData()
        }
    }

    @objc func handleEditProfile() {
        updateConfigVisibility(visibility: .show)
    }

    @objc func handleBlurTap() {
        view.endEditing(true)
        updateConfigVisibility(visibility: .hide)
    }

    @objc func handleDone() {
        guard let name = editProfileBottomView.nameTextField.text,
              !name.isEmpty,
              let email = editProfileBottomView.emailTextField.text,
              !email.isEmpty,
              let phoneNumber = editProfileBottomView.phoneTextField.text,
              !phoneNumber.isEmpty else {
            updateErrorVisibility(error: "Please check your input", visiility: .show)
            return
        }
        view.endEditing(true)
        updateErrorVisibility(visiility: .hide)
        viewModel?.updateUserInfo(userInfo: UserInfo(name: name, email: email, phoneNumber: phoneNumber))
        upateProfileSection()
        updateConfigVisibility(visibility: .hide)
    }
}
