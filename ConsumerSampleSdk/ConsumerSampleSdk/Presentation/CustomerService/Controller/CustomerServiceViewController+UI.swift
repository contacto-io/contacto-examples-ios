import UIKit

extension CustomerServiceViewController {
    func setupUI() {
        view.backgroundColor = UIColor(hexString: "#FBFAFD")
        setupSubviews()
        setupLayout()
        setupTableView()
    }
    
    private func setupSubviews() {
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(serviceTableView)
        view.addSubview(chatButton)
    }
    
    private func setupLayout() {
        backButton.anchors(top: view.safeAreaLayoutGuide.topAnchor,
                           topConstants: 20,
                           leading: view.leadingAnchor,
                           leadingConstants: 20,
                           heightConstants: 30,
                           widthConstants: 30)
        titleLabel.anchors(widthConstants: 170,
                           centerX: view.centerXAnchor,
                           centerY: backButton.centerYAnchor)
        chatButton.anchors(leading: view.leadingAnchor,
                           leadingConstants: 20,
                           bottom: view.safeAreaLayoutGuide.bottomAnchor,
                           bottomConstants: -20,
                           trailing: view.trailingAnchor,
                           trailingConstants: -20,
                           heightConstants: 48)
        serviceTableView.anchors(top: titleLabel.bottomAnchor,
                                  topConstants: 30,
                                  leading: view.leadingAnchor,
                                  bottom: chatButton.topAnchor,
                                  trailing: view.trailingAnchor)
    }
    private func setupTableView() {
        serviceTableView.register(ActiveConversationCell.self, forCellReuseIdentifier: "ActiveConversationCell")
        serviceTableView.register(MostSearchedCell.self, forCellReuseIdentifier: "MostSearchedCell")
        serviceTableView.tableFooterView = UIView()
        serviceTableView.separatorStyle = .none
    }
}
