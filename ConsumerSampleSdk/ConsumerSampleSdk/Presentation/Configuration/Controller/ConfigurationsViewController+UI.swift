import UIKit

extension ConfigurationsViewController {
    func setupUI() {
        view.backgroundColor = UIColor(hexString: "#FBFAFD")
        setupLayout()
        setupConstraints()
        setupTableView()
        addTapGesture()
        setupKeyboardOberservers()
    }
    
    private func setupLayout() {
        view.addSubview(blurView)
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(configurationsTableView)
        blurView.addSubview(chatConfigBottomView)
    }
    
    private func setupConstraints() {
        backButton.anchors(top: view.safeAreaLayoutGuide.topAnchor,
                           topConstants: 20,
                           leading: view.leadingAnchor,
                           leadingConstants: 20,
                           heightConstants: 30,
                           widthConstants: 30)
        titleLabel.anchors(widthConstants: 150,
                           centerX: view.centerXAnchor,
                           centerY: backButton.centerYAnchor)
        configurationsTableView.anchors(top: titleLabel.bottomAnchor,
                                  topConstants: 30,
                                  leading: view.leadingAnchor,
                                  bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                  trailing: view.trailingAnchor)
        chatConfigBottomView.anchors(leading: view.leadingAnchor,
                                     trailing: view.trailingAnchor,
                                     heightConstants: bottomConfigHeight)
        configViewBottomConstraint = chatConfigBottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: bottomConfigHeight)
        configViewBottomConstraint?.isActive = true
        
        blurView.anchors(top: view.topAnchor,
                         leading: view.leadingAnchor,
                         bottom: view.safeAreaLayoutGuide.bottomAnchor,
                         trailing: view.trailingAnchor)
    }
    
    private func setupTableView() {
        configurationsTableView.register(ConfigurationCell.self, forCellReuseIdentifier: "ConfigurationCell")
        configurationsTableView.tableFooterView = UIView()
        configurationsTableView.separatorStyle = .none
    }
    
    private func addTapGesture() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleBlurTap))
        blurView.addGestureRecognizer(tap)
    }
}
