import UIKit

extension  CustomerServiceViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfSections()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfItems(in: section)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionType = CustomerServiceType(rawValue: indexPath.section),
              let viewModel = viewModel else {
            return UITableViewCell()
        }
        switch sectionType {
        case .active:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ActiveConversationCell", for: indexPath) as? ActiveConversationCell else { return UITableViewCell() }
            cell.updateContent(data: viewModel.activeDataSource[indexPath.item])
            return cell
            
        case .mostSearched:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MostSearchedCell", for: indexPath) as? MostSearchedCell else { return UITableViewCell() }
            cell.updateContent(data: viewModel.mostSearchedDataSource[indexPath.row])
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionType = CustomerServiceType(rawValue: section) else {
            return nil
        }
        switch sectionType {
        case .active:
            return activeHeaderView
        case .mostSearched:
            return mostSearchedHeaderView
            
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let emptyView = UIView()
        emptyView.backgroundColor = UIColor(hexString: "#FBFAFD")
        return emptyView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let sectionType = CustomerServiceType(rawValue: indexPath.section) else {
            return 0
        }
        switch sectionType {
        case .active:
            return 130
        case .mostSearched:
            return 50
            
        }
    }
}
