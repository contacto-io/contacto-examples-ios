import UIKit

extension  SettingsViewController {
    func setupUI() {
        view.backgroundColor = UIColor(hexString: "#FBFAFD")
        setupLayout()
        setupConstraints()
        setupTableView()
    }
    
    private func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(numberLabel)
        view.addSubview(settingsTableView)
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
                           widthConstants: 200,
                           centerX: view.centerXAnchor)
        numberLabel.anchors(top: emailLabel.bottomAnchor,
                           topConstants: 2,
                           widthConstants: 200,
                           centerX: view.centerXAnchor)
        settingsTableView.anchors(top: numberLabel.bottomAnchor,
                                  topConstants: 30,
                                  leading: view.leadingAnchor,
                                  bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                  trailing: view.trailingAnchor)
    }
    
    private func setupTableView() {
        settingsTableView.register(SettingsItemCell.self, forCellReuseIdentifier: "SettingsItemCell")
        settingsTableView.tableFooterView = UIView()
        settingsTableView.separatorStyle = .none
    }
}
