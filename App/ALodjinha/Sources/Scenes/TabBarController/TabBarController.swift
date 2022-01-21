import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - View's Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarAppearance()
        setupViewController()
    }
}

    // MARK: - Private Methods

private extension TabBarController {
    
    func setupTabBarAppearance() {
        UITabBar.appearance().barTintColor = UIColor.beige
        tabBar.tintColor =  UIColor.purple
        
        if #available(iOS 13.0, *) {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = UIColor.beige
            UITabBar.appearance().standardAppearance = tabBarAppearance
            
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
        }
    }
    
    func setupViewController() {
        viewControllers = [
            createNavigationController(for: .home),
            createNavigationController(for: .about)
        ]
    }
    
    func createNavigationController(for tab: TabControllerType) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: tab.view)
        let icon = tab.icon
        let size = Metrics.TabController.iconSize
        
        if #available(iOS 10.0, *) {
            navigationController.tabBarItem.image = icon.upscale(targetSize: size)
        } else {
            navigationController.tabBarItem.image = tab.icon
        }
        
        styleTabBar(navigationController, for: tab)
        
        if #available(iOS 13.0, *) { styleNavBarNewiOS() }
        
        Styles.makeShadowFor(navigationController.navigationBar, color: .black, radius: 20, opacity: 1, offSet: .zero)
        
        return navigationController
    }
    
    func styleTabBar(_ navController: UINavigationController, for tab: TabControllerType) {
        navController.tabBarItem.title = tab.title
        navController.navigationBar.barTintColor = .purple
        navController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navController.navigationBar.tintColor = .white
    }
    
    @available(iOS 13.0, *)
    func styleNavBarNewiOS() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        navigationBarAppearance.backgroundColor = .purple
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }

}
