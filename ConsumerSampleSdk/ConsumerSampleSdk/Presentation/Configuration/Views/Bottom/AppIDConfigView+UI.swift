import UIKit

extension AppIDConfigView {
    func setupUI() {
        setupLayout()
        setupConstraints()
    }
    
    private func setupLayout() {
        addSubview(titleLabel)
        addSubview(cancelButton)
        addSubview(doneButton)
        addSubview(chatIdTextField)
        addSubview(chatIdLabel)
        addSubview(chatKeyTextField)
        addSubview(chatKeyLabel)
        addSubview(errorLabel)
    }
    
    private func setupConstraints() {
        titleLabel.anchors(top: topAnchor,
                           topConstants: 20,
                           widthConstants: 150,
                           centerX: centerXAnchor)
        cancelButton.anchors(leading: leadingAnchor,
                             leadingConstants: 20,
                             heightConstants: 20,
                             widthConstants: 60,
                             centerY: titleLabel.centerYAnchor)
        doneButton.anchors(trailing: trailingAnchor,
                             trailingConstants: -20,
                             heightConstants: 20,
                             widthConstants: 60,
                             centerY: titleLabel.centerYAnchor)
        
        chatIdTextField.anchors(top: titleLabel.bottomAnchor,
                                topConstants: 30,
                                leading: cancelButton.leadingAnchor,
                                trailing: doneButton.trailingAnchor,
                                heightConstants: 40)
        chatIdLabel.anchors(top: chatIdTextField.bottomAnchor,
                             topConstants: 10,
                             leading: chatIdTextField.leadingAnchor,
                             trailing: chatIdTextField.trailingAnchor)
        chatKeyTextField.anchors(top: chatIdLabel.bottomAnchor,
                                topConstants: 20,
                                leading: cancelButton.leadingAnchor,
                                trailing: doneButton.trailingAnchor,
                                heightConstants: 40)
        chatKeyLabel.anchors(top: chatKeyTextField.bottomAnchor,
                             topConstants: 10,
                             leading: chatIdTextField.leadingAnchor,
                             trailing: chatIdTextField.trailingAnchor)
        errorLabel.anchors(top: chatKeyLabel.bottomAnchor,
                           topConstants: 20,
                           leading: chatKeyLabel.leadingAnchor,
                           trailing: chatKeyLabel.trailingAnchor)
    }
}
