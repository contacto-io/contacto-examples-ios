import UIKit

extension  SettingsViewController {
    func setupUI() {
        view.backgroundColor = UIColor(hexString: "#FBFAFD")
        setupLayout()
        setupConstraints()
        addTapGesture()
        setupTableView()
        setupKeyboardOberservers()
    }
    
    private func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(numberLabel)
        view.addSubview(editButton)
        view.addSubview(settingsTableView)
        view.addSubview(blurView)
        view.addSubview(editProfileBottomView)
    }
    
    private func setupConstraints() {
        titleLabel.anchors(top: view.safeAreaLayoutGuide.topAnchor,
                           topConstants: 20,
                           widthConstants: 100,
                           centerX: view.centerXAnchor)
        nameLabel.anchors(top: titleLabel.bottomAnchor,
                           topConstants: 70,
                           widthConstants: 200,
                           centerX: view.centerXAnchor)
        emailLabel.anchors(top: nameLabel.bottomAnchor,
                           topConstants: 2,
                           widthConstants: 300,
                           centerX: view.centerXAnchor)
        numberLabel.anchors(top: emailLabel.bottomAnchor,
                           topConstants: 2,
                           widthConstants: 200,
                           centerX: view.centerXAnchor)
        editButton.anchors(top: nameLabel.topAnchor,
                           trailing: view.trailingAnchor,
                           trailingConstants: -20,
                           heightConstants: 20,
                           widthConstants: 50)
        settingsTableView.anchors(top: numberLabel.bottomAnchor,
                                  topConstants: 30,
                                  leading: view.leadingAnchor,
                                  bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                  trailing: view.trailingAnchor)
        editProfileBottomView.anchors(leading: view.leadingAnchor,
                                     trailing: view.trailingAnchor,
                                     heightConstants: editProfileViewHeight)
        editProfileViewBottomConstraint = editProfileBottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: editProfileViewBottomConstants)
        editProfileViewBottomConstraint?.isActive = true
        
        blurView.anchors(top: view.topAnchor,
                         leading: view.leadingAnchor,
                         bottom: view.safeAreaLayoutGuide.bottomAnchor,
                         trailing: view.trailingAnchor)
    }
    
    private func setupTableView() {
        settingsTableView.register(SettingsItemCell.self, forCellReuseIdentifier: "SettingsItemCell")
        settingsTableView.tableFooterView = UIView()
        settingsTableView.separatorStyle = .none
    }

    private func addTapGesture() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleBlurTap))
        blurView.addGestureRecognizer(tap)
    }
}
