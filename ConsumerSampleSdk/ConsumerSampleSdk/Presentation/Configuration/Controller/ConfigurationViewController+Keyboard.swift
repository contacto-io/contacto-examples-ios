import UIKit

extension ConfigurationsViewController {
    func setupKeyboardOberservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.view.transform = CGAffineTransform(translationX: 0,
                                                                y: -keyboardSize.height + strongSelf.view.safeAreaBottom)
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.1) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.view.transform = .identity
        }
    }

    @objc private func appMovedToBackground() {
        view.endEditing(true)
    }

    func removeKeyboardOberservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
