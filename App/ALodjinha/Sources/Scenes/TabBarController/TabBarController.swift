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
        let navigationControler = UINavigationController(rootViewController: tab.view)
        
        navigationControler.tabBarItem.title = tab.title
        navigationControler.tabBarItem.image = tab.icon
        tab.view.navigationItem.title = tab.title
        
        return navigationControler
    }
}
