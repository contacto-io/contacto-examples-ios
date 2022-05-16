import UIKit
extension OrdersViewController {
    func setupUI() {
        view.backgroundColor = UIColor(hexString: "#FBFAFD")
        setupSubviews()
        setupLayout()
        setupTableView()
    }
    
    private func setupSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(ordersTableView)
    }
    
    private func setupLayout() {
        titleLabel.anchors(top: view.safeAreaLayoutGuide.topAnchor,
                           topConstants: 30,
                           widthConstants: 170,
                           centerX: view.centerXAnchor)
        ordersTableView.anchors(top: titleLabel.bottomAnchor,
                                  topConstants: 20,
                                  leading: view.leadingAnchor,
                                  bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                  trailing: view.trailingAnchor)
    }
    
    private func setupTableView() {
        ordersTableView.register(OrdersCell.self, forCellReuseIdentifier: "OrdersCell")
        ordersTableView.tableFooterView = UIView()
        ordersTableView.separatorStyle = .none
    }
}
