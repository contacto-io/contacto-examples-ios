import UIKit

extension  SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.datasources?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsItemCell", for: indexPath) as? SettingsItemCell,
              let viewModel = viewModel,
              let dataSource = viewModel.datasources else { return UITableViewCell() }
        cell.setupContent(item: dataSource[indexPath.item])
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        handleCellClick(index: indexPath.row)
    }
    
    
    private func handleCellClick(index: Int) {
        guard let viewModel = self.viewModel,
              let dataSource = viewModel.datasources else { return  }
        switch dataSource[index] {
        case .configuration:
            viewModel.moveToConfiguration()
        case .customerService:
            viewModel.moveToCustomerService()
        }
    }
    
    
}
