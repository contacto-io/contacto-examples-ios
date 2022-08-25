extension EditProfileView {
    func setupUI() {
        setupLayout()
        setupConstraints()
    }
    
    private func setupLayout() {
        addSubview(titleLabel)
        addSubview(cancelButton)
        addSubview(doneButton)
        addSubview(firstNameLabel)
        addSubview(firstNameTextField)
        addSubview(lastNameLabel)
        addSubview(lastNameTextField)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(phoneNumberLabel)
        addSubview(phoneTextField)
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
        
        firstNameLabel.anchors(top: titleLabel.bottomAnchor,
                          topConstants: 30,
                          leading: cancelButton.leadingAnchor,
                          trailing: doneButton.trailingAnchor,
                          heightConstants: 40)
        firstNameTextField.anchors(top: firstNameLabel.bottomAnchor,
                             topConstants: 10,
                             leading: firstNameLabel.leadingAnchor,
                             trailing: firstNameLabel.trailingAnchor)
        lastNameLabel.anchors(top: firstNameTextField.bottomAnchor,
                                topConstants: 20,
                                leading: cancelButton.leadingAnchor,
                                trailing: doneButton.trailingAnchor,
                                heightConstants: 40)
        lastNameTextField.anchors(top: lastNameLabel.bottomAnchor,
                             topConstants: 10,
                             leading: emailLabel.leadingAnchor,
                             trailing: emailLabel.trailingAnchor)
        emailLabel.anchors(top: lastNameTextField.bottomAnchor,
                                topConstants: 20,
                                leading: cancelButton.leadingAnchor,
                                trailing: doneButton.trailingAnchor,
                                heightConstants: 40)
        emailTextField.anchors(top: emailLabel.bottomAnchor,
                             topConstants: 10,
                             leading: emailLabel.leadingAnchor,
                             trailing: emailLabel.trailingAnchor)
        phoneNumberLabel.anchors(top: emailTextField.bottomAnchor,
                           topConstants: 20,
                           leading: emailTextField.leadingAnchor,
                           trailing: emailTextField.trailingAnchor)
        phoneTextField.anchors(top: phoneNumberLabel.bottomAnchor,
                           topConstants: 10,
                           leading: phoneNumberLabel.leadingAnchor,
                           trailing: phoneNumberLabel.trailingAnchor)
        errorLabel.anchors(top: phoneTextField.bottomAnchor,
                           topConstants: 20,
                           leading: phoneTextField.leadingAnchor,
                           trailing: phoneTextField.trailingAnchor)
    }
    
    func updateDoneButtonEnable(isEnabled: Bool) {
        doneButton.isEnabled = isEnabled
        doneButton.alpha = isEnabled ? 1.0 : 0.2
    }
}
