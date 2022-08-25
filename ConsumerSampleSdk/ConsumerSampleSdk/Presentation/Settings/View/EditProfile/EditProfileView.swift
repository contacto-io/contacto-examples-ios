import UIKit
 
class EditProfileView: UIView {
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Cancel", for: .normal)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Edit Profile"
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
    
    lazy var firstNameLabel: UILabel = {
        let label = UILabel()
        label.text = "First name"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    lazy var firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        textField.placeholder = "Enter your first name"
        textField.textColor = .black
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.returnKeyType = .done
        textField.autocorrectionType = .no
        return textField
    }()

    lazy var lastNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Last name"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    lazy var lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        textField.placeholder = "Enter your last name"
        textField.textColor = .black
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.returnKeyType = .done
        textField.autocorrectionType = .no
        return textField
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.placeholder = "Enter your email"
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.returnKeyType = .done
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    lazy var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone Number"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.placeholder = "Enter your phone number"
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.returnKeyType = .done
        textField.keyboardType = .numberPad
        return textField
    }()
    
    lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
