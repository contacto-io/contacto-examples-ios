import UIKit

extension SettingsViewController {
    func updateConfigVisibility(visibility: Visibility) {
        self.editProfileViewBottomConstraint?.constant = visibility == .show ? 0 : self.editProfileViewBottomConstants
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       options: .curveEaseOut) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.blurView.isHidden = visibility == .hide
        }
    }
    
    func upateProfileSection() {
        let userInfo = UserDefaults.standard.userInfo
        nameLabel.text = userInfo.firstName + " " + userInfo.lastName
        emailLabel.text = userInfo.email
        numberLabel.text = userInfo.phoneNumber
        editProfileBottomView.emailTextField.text = userInfo.email
        editProfileBottomView.firstNameTextField.text = userInfo.firstName
        editProfileBottomView.lastNameTextField.text = userInfo.lastName
        editProfileBottomView.phoneTextField.text = userInfo.phoneNumber
    }
    
    func updateErrorVisibility(error: String? = nil, visiility: Visibility) {
        editProfileBottomView.errorLabel.text = error
        editProfileBottomView.errorLabel.isHidden = visiility == .hide
    }
}
