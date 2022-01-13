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
        UITabBar.appearance().barTintColor = UIColor(red: 245/255, green: 245/255, blue: 244/255, alpha: 255/255)
        tabBar.tintColor = UIColor(red: 99/255, green: 66/255, blue: 140/255, alpha: 255/255)
        
        if #available(iOS 13.0, *) {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = UIColor(named: "TabBar")
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
