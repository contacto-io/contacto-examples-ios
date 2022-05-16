import UIKit

extension  ConfigurationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.datasource.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ConfigurationCell", for: indexPath) as? ConfigurationCell,
              let viewModel = viewModel else { return UITableViewCell() }
        cell.setupContent(item: viewModel.datasource[indexPath.item], isLast: viewModel.datasource.count == indexPath.row + 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        switch viewModel.datasource[indexPath.row].actionType {
        case .detail:
            updateConfigVisibility(visibility: .show)
        case .switch:
            break
        }
    }
}

