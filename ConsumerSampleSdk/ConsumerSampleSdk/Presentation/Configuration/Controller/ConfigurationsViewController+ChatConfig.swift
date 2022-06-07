import UIKit

extension ConfigurationsViewController {
    
    func updateConfigVisibility(visibility: Visibility) {
        self.configViewBottomConstraint?.constant = visibility == .show ? 0 : self.configBottomConstants
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       options: .curveEaseOut) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.blurView.isHidden = visibility == .hide
        }
    }
    
    func updateErrorVisibility(error: String? = nil, visiility: Visibility) {
        chatConfigBottomView.errorLabel.text = error
        chatConfigBottomView.errorLabel.isHidden = visiility == .hide
    }
    
    func updateChatIdsAndKeysFromConfig() {
        let chatId = UserDefaults.standard.contactoInitInfo.appId
        let chatKey = UserDefaults.standard.contactoInitInfo.appKey
        guard !chatId.isEmpty, !chatKey.isEmpty else {
            setChatConfigValues(key: "", id: "")
            chatConfigBottomView.updateDoneButtonEnable(isEnabled: false)
            return
        }
        setChatConfigValues(key: chatKey, id: chatId)
        chatConfigBottomView.updateDoneButtonEnable(isEnabled: true)
    }
    
    private func setChatConfigValues(key: String, id: String) {
        chatConfigBottomView.chatIdTextField.text = id
        chatConfigBottomView.chatKeyTextField.text = key
        viewModel?.chatId = id
        viewModel?.chatKey = key
    }

}
