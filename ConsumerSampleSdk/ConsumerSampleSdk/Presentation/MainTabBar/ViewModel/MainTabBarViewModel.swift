import UIKit

protocol MainTabBarVMPresentable {
    var dataSource: [TabBarScreens]? { get set }
    func generateAppModeDataSource()
    func loadSetting(navigation: UINavigationController)
    func loadOrders(navigation: UINavigationController)
}

class MainTabBarViewModel: MainTabBarVMPresentable {
    var coordinator: MainTabBarCoordinator?
    var dataSource: [TabBarScreens]?
    
    func generateAppModeDataSource() {
        var data = [TabBarScreens]()
        data.append(.home)
        data.append(.organizer)
        data.append(.cart)
        data.append(.settings)
        dataSource = data
    }
    
    func loadSetting(navigation: UINavigationController) {
        coordinator?.loadSettings(navigation: navigation)
    }
    
    func loadOrders(navigation: UINavigationController) {
        coordinator?.loadOrders(navigation: navigation)
    }
}
