import UIKit

class MainTabBarController: UITabBarController {
    var viewModel: MainTabBarVMPresentable?
    var selectedTab: Int = 0

    func initateTabBar() {
        guard let viewModel = viewModel else { return }
        viewModel.generateAppModeDataSource()
        setupTabBarUI()
        delegate = self
        setInitialTab(tab: selectedTab)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let barHeight = view.safeAreaBottom > 0 ?
        80 + view.safeAreaBottom : 64
        tabBar.frame.size.height = barHeight
    }
    private func setController(tab: Int, controller: UINavigationController) {
        guard let viewModel = viewModel, let dataSource = viewModel.dataSource else { return }
        selectTab(tabType: dataSource[tab])
    }

    func setInitialTab(tab: Int) {
        if let controller = customizableViewControllers?[tab] as? UINavigationController {
            selectedIndex = tab
            setController(tab: tab, controller: controller)
        }
    }

    fileprivate func setupTabBarUI() {
        setTabbarAppearance()
        setViewControllers(generateTabBarVCBasedOnData(), animated: false)
        guard let tabBarItems = self.tabBar.items else {
            return
        }

        for (index, item) in tabBarItems.enumerated() {
            if let imageString = getTabBarImageBaseOnData(index: index, isSelectedImage: false),
               let image = UIImage(named: imageString) {
                item.image = image.withRenderingMode(.automatic)
            } else {
               return
            }
        }
    }
    private func generateTabBarVCBasedOnData() -> [CustomNavigationController] {
        var controller: [CustomNavigationController] = []
        guard let viewModel = viewModel, let dataSource = viewModel.dataSource else {
            return [CustomNavigationController()]
        }
        for _ in dataSource {
            let view = CustomNavigationController()
            view.navigationBar.isHidden = true
            controller.append(view)
        }
        return controller
    }

    func handleTabSelection(selectedIndex: Int) {
        if let items = tabBar.items,
           let imageString = getTabBarImageBaseOnData(index: selectedIndex, isSelectedImage: true),
           let image = UIImage(named: imageString) {
            items[selectedIndex].selectedImage = image.withRenderingMode(.alwaysTemplate)
            items[selectedIndex].selectedImage?.withTintColor(.orange)
        } else {
            return
        }
    }
    func getTabBarImageBaseOnData(index: Int, isSelectedImage: Bool) -> String? {
        guard let viewModel = viewModel, let dataSource = viewModel.dataSource else {
            return nil
        }
        return dataSource[index].getTabBarImage(isSelectedImage: isSelectedImage)
    }
    func tabbarDidSelectViewController(selectedIndex: Int) {
        guard let viewModel = viewModel, let dataSource = viewModel.dataSource else {
            return
        }
        selectTab(tabType: dataSource[selectedIndex])
    }

    private func selectTab(tabType: TabBarScreens) {
        guard let controller = viewControllers?[selectedIndex] as? UINavigationController,
              let viewModel = viewModel else {
            return
        }
        switch tabType {
        case .home:
            loadHome(navigation: controller)
        case .organizer:
            loadOrganizer(navigation: controller)
        case .cart:
            viewModel.loadOrders(navigation: controller)
        case .settings:
            viewModel.loadSetting(navigation: controller)
        }
        handleTabSelection(selectedIndex: selectedIndex)
    }

    private func setTabbarAppearance() {
        tabBar.barTintColor = .white
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        tabbarDidSelectViewController(selectedIndex: tabBarController.selectedIndex)
    }
}
