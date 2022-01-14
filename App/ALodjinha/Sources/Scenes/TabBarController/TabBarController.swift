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
        
        navigationController.tabBarItem.title = tab.title
        navigationController.tabBarItem.image = tab.icon
        navigationController.navigationBar.barTintColor = .purple
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        if #available(iOS 13.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithDefaultBackground()
            navigationBarAppearance.backgroundColor = .purple
            navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
        
        return navigationController
    }
}
