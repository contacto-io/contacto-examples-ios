import UIKit

class AppIDConfigView: UIView {
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Cancel", for: .normal)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Chat App ID"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Done", for: .normal)
        return button
    }()
    
    lazy var chatIdTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        textField.placeholder = "Enter the Chat App ID"
        textField.textColor = .black
        textField.text = "a4ef65e8-5908-4c65-8b65-52ff7a2bf8eb"
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.tag = ChatConfigType.chatId.rawValue
        return textField
    }()
    
    lazy var chatIdLabel: UILabel = {
        let label = UILabel()
        label.text = "This short description gives info about how to find the Chat App ID"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var chatKeyTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.placeholder = "Enter the Chat App Key"
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.text = "665255e3914bb5060b0ba7102a8bade8d7dcf21e734093818863ac759725b3f6"
        textField.tag = ChatConfigType.chatKey.rawValue
        return textField
    }()
    
    lazy var chatKeyLabel: UILabel = {
        let label = UILabel()
        label.text = "This short description gives info about how to find the Chat App Key"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
