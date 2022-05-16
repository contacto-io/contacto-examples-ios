import UIKit

typealias EmptyClosure = () -> Void

final class Router: RouterType {
    
    let navigationController: UINavigationController
    var rootViewController: UIViewController? {
        return navigationController.viewControllers.first
    }
    
    private var completions: [UIViewController: () -> Void]
    init(rootController: UINavigationController) {
        self.navigationController = rootController
        completions = [:]
    }
    
    func toPresent() -> UIViewController? {
        return navigationController
    }
    
    func push(_ module: Presentable?) {
        push(module, animated: true)
    }
    
    func push(_ module: Presentable?, hideBottomBar: Bool) {
        push(module, animated: true, hideBottomBar: hideBottomBar, completion: nil)
    }
    
    func push(_ module: Presentable?, animated: Bool) {
        push(module, animated: animated, completion: nil)
    }
    
    func push(_ module: Presentable?, animated: Bool, completion: EmptyClosure?) {
        push(module, animated: animated, hideBottomBar: true, completion: completion)
    }
    
    func push(_ module: Presentable?, animated: Bool, hideBottomBar: Bool, completion: EmptyClosure?) {
        guard
            let controller = module?.toPresent(),
            (controller is UINavigationController == false)
            else { assertionFailure("Deprecated push UINavigationController."); return }
        if let completion = completion {
            completions[controller] = completion
        }
        controller.hidesBottomBarWhenPushed = hideBottomBar
        navigationController.pushViewController(controller, animated: animated)
    }
    
    func popModule() {
        popModule(animated: true)
    }
    
    func popModule(animated: Bool) {
        if let controller = navigationController.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }
    
    func popModule(animated: Bool, completion: EmptyClosure?) {
        if let controller = navigationController.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }
    
    func pop(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.toPresent()
            else {  return }
        navigationController.popToViewController(controller, animated: animated)
    }
    
    func setRootModule(_ module: Presentable?) {
        setRootModule(module, hideBar: false)
    }
    
    func setRootModule(_ module: Presentable?, hideBar: Bool) {
        guard let controller = module?.toPresent() else { return }
        navigationController.setViewControllers([controller], animated: false)
        navigationController.isNavigationBarHidden = hideBar
    }
    
    private func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
}
