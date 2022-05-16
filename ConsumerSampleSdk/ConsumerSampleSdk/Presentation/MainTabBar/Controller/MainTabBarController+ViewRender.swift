import UIKit

extension MainTabBarController {
    func loadHome(navigation: UINavigationController) {
        let controller = UIViewController()
        controller.view.backgroundColor = .green
        navigation.setViewControllers([controller], animated: true)
    }
    
    func loadOrganizer(navigation: UINavigationController) {
        let controller = UIViewController()
        controller.view.backgroundColor = .yellow
        navigation.setViewControllers([controller], animated: true)
    }
    
    func loadCart(navigation: UINavigationController) {
        if navigation.viewControllers.isEmpty {
            let controller = OrdersViewController()
            navigation.setViewControllers([controller], animated: true)
        }
        else {
            navigation.popToRootViewController(animated: false)
        }
        
    }
}
