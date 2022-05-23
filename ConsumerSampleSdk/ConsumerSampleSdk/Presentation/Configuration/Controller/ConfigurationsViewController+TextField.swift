import UIKit
 
extension ConfigurationsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let configType = ChatConfigType(rawValue: textField.tag) else {
            return true
        }
        switch configType {
        case .chatId:
            chatConfigBottomView.chatKeyTextField.becomeFirstResponder()
        case .chatKey:
            chatConfigBottomView.chatKeyTextField.resignFirstResponder()
        }
        return true
    }
}
