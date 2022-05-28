import UIKit

extension ConfigurationsViewController {
    
    func updateConfigVisibility(visibility: Visibility) {
        self.configViewBottomConstraint?.constant = visibility == .show ? 0 : self.bottomConfigHeight
        UIView.animate(withDuration: 0.5,
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
}
