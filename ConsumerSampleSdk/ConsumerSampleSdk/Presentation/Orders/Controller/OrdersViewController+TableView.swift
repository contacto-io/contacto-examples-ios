import UIKit

extension OrdersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrdersCell", for: indexPath) as? OrdersCell,
              let viewModel = viewModel else { return UITableViewCell() }
        cell.updateContent(data: viewModel.dataSource[indexPath.item])
        cell.chatButton.addTarget(self, action: #selector(handleChat), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }

    @objc func handleChat() {
        viewModel?.loadChat(navigation: navigationController!)
    }

}
