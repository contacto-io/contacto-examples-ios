import UIKit

class ConfigurationsViewController: UIViewController {
    
    var viewModel: ConfigurationVMPresentable?
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Configurations"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var configurationsTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(hexString: "#FBFAFD")
        return tableView
    }()
    
    lazy var chatConfigBottomView: AppIDConfigView = {
        let view = AppIDConfigView()
        view.backgroundColor = UIColor.white
        view.cancelButton.addTarget(self, action: #selector(handleBlurTap), for: .touchUpInside)
        view.doneButton.addTarget(self, action: #selector(handleDone), for: .touchUpInside)
        view.chatIdTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        view.chatKeyTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        view.chatIdTextField.delegate = self
        view.chatKeyTextField.delegate = self
        return view
    }()
    
    lazy var blurView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        view.isHidden = true
        view.isUserInteractionEnabled = true
        return view
    }()
    
    var configViewBottomConstraint: NSLayoutConstraint?
    let configViewHeight: CGFloat = 310
    var configBottomConstants: CGFloat {
        return view.safeAreaInsets.bottom + configViewHeight
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        binder()
        viewModel?.getAllConfigurations()
        updateChatIdsAndKeysFromConfig()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        chatConfigBottomView.roundCorners(corners: [.topLeft, .topRight], radius: 20)
    }
    private func binder() {
        guard var viewModel = viewModel else { return }
        viewModel.reloadTable = { [weak self] in
            guard let self = self else { return }
            self.configurationsTableView.reloadData()
        }
    }
    
     @objc private func handleBack() {
        viewModel?.handleBack()
    }
    
    
    @objc func handleBlurTap() {
        view.endEditing(true)
        updateConfigVisibility(visibility: .hide)
        updateChatIdsAndKeysFromConfig()
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard let configType = ChatConfigType(rawValue: textField.tag),
              var viewModel = viewModel else { return }
        
        switch configType {
        case .chatId:
            viewModel.chatId = textField.text
        case .chatKey:
            viewModel.chatKey = textField.text
        }
        if let chatId = viewModel.chatId,
           let chatKey = viewModel.chatKey,
           !chatId.isEmpty,
           !chatKey.isEmpty {
            chatConfigBottomView.updateDoneButtonEnable(isEnabled: true)
        }
        else {
            chatConfigBottomView.updateDoneButtonEnable(isEnabled: false)
        }
    }
    
    @objc func handleDone() {
        guard let viewModel = viewModel,
              let chatId = viewModel.chatId,
              !chatId.isEmpty,
              let chatKey = viewModel.chatKey,
              !chatKey.isEmpty else {
            updateErrorVisibility(error: "Please check your inputs", visiility: .show)
            return }
        updateErrorVisibility(visiility: .hide)
        view.endEditing(true)
        updateConfigVisibility(visibility: .hide)
        viewModel.updateChatConfiguration(with: chatId, and: chatKey)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
