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
        UITabBar.appearance().barTintColor = UIColor.purple
        tabBar.tintColor =  UIColor.beige
        
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
            createNavigationController(for: HomeViewController(), title: "Home", icon: UIImage(named: "home")!),
            createNavigationController(for: AboutViewController(), title: "About", icon: UIImage(named: "tag")!)
        ]
    }
    
    func createNavigationController(for rootViewController: UIViewController, title: String, icon: UIImage) -> UIViewController {
        let navigationControler = UINavigationController(rootViewController: rootViewController)
        
        navigationControler.tabBarItem.title = title
        navigationControler.tabBarItem.image = icon
        rootViewController.navigationItem.title = title
        
        return navigationControler
    }
}
