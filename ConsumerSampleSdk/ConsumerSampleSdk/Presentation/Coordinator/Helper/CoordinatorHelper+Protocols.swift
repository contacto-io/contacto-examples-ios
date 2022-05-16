import UIKit

protocol CoordinatorType: AnyObject {
    func start()
    func start(with options: Navigation)
    func resume()
}

protocol CoordinatorFactoryType {
    func makeMainTabCoordinator(window: UIWindow, coordinatorFactory: CoordinatorFactoryType) -> Coordinator
    func makeSettingsCoordinator(router: Router, coordinatorFactory: CoordinatorFactoryType) -> Coordinator
    func loadOrders(router: Router, coordinatorFactory: CoordinatorFactoryType) -> Coordinator
}

public protocol Presentable {
    func toPresent() -> UIViewController?
}

protocol RouterType: Presentable {
    var navigationController: UINavigationController { get }
    
    func push(_ module: Presentable?)
    func push(_ module: Presentable?, hideBottomBar: Bool)
    func push(_ module: Presentable?, animated: Bool)
    func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)
    func push(_ module: Presentable?, animated: Bool, hideBottomBar: Bool, completion: (() -> Void)?)
    func popModule()
    func popModule(animated: Bool)
    func popModule(animated: Bool, completion: (() -> Void)?)
    func setRootModule(_ module: Presentable?)
    func setRootModule(_ module: Presentable?, hideBar: Bool)
}

extension UIViewController: Presentable {
    public func toPresent() -> UIViewController? {
        return self
    }
}
