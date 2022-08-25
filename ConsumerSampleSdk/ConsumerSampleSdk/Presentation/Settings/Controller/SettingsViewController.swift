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
        label.numberOfLines = 0
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "alex@example.com"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "919986486551"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
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
        view.firstNameTextField.delegate = self
        view.phoneTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        view.emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        view.firstNameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        view.lastNameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return view
    }()

    lazy var blurView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        view.isHidden = true
        view.isUserInteractionEnabled = true
        return view
    }()

    let editProfileViewHeight: CGFloat = 500
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
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        updateConfigVisibility(visibility: .hide)
        updateErrorVisibility(visiility: .hide)
    }

    private func binder() {
        guard var viewModel = viewModel else { return }
        viewModel.reloadTableView = { [weak self] in
            guard let self = self else { return }
            self.settingsTableView.reloadData()
        }
    }

    @objc func handleEditProfile() {
        upateProfileSection()
        updateConfigVisibility(visibility: .show)
    }

    @objc func handleBlurTap() {
        view.endEditing(true)
        updateConfigVisibility(visibility: .hide)
    }

    @objc func handleDone() {
        guard let firstName = editProfileBottomView.firstNameTextField.text,
              !firstName.trimmingCharacters(in: .whitespaces).isEmpty,
              let email = editProfileBottomView.emailTextField.text,
              !email.isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              email.isValidEmail(),
              let phoneNumber = editProfileBottomView.phoneTextField.text,
              !phoneNumber.isEmpty,
              let lastName = editProfileBottomView.lastNameTextField.text,
              !lastName.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            updateErrorVisibility(error: "Please check your input", visiility: .show)
            return
        }
        view.endEditing(true)
        updateErrorVisibility(visiility: .hide)
        viewModel?.updateUserInfo(userInfo: UserInfo(firstName: firstName,
                                                     lastName: lastName,
                                                     email: email,
                                                     phoneNumber: phoneNumber))
        upateProfileSection()
        updateConfigVisibility(visibility: .hide)
    }

    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard let firstName =  editProfileBottomView.firstNameTextField.text,
              !firstName.trimmingCharacters(in: .whitespaces).isEmpty,
              let email = editProfileBottomView.emailTextField.text,
              let phone = editProfileBottomView.phoneTextField.text,
              let lastName = editProfileBottomView.lastNameTextField.text,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !lastName.trimmingCharacters(in: .whitespaces).isEmpty,
              !lastName.isEmpty,
              !firstName.isEmpty,
              !email.isEmpty,
              !phone.isEmpty else {
            editProfileBottomView.updateDoneButtonEnable(isEnabled: false)
            return
        }
        editProfileBottomView.updateDoneButtonEnable(isEnabled: true)
    }
}
