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
        UITabBar.appearance().barTintColor = .darkGray
        tabBar.tintColor = .black
        
        if #available(iOS 13.0, *) {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = UIColor.darkGray
            UITabBar.appearance().standardAppearance = tabBarAppearance
            
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
        }
    }
    
    func setupViewController() {
        viewControllers = [
            createNavigationController(for: HomeViewController(), title: "Home"),
            createNavigationController(for: AboutViewController(), title: "About")
        ]
    }
    
    func createNavigationController(for rootViewController: UIViewController, title: String) -> UIViewController {
        let navigationControler = UINavigationController(rootViewController: rootViewController)
        
        navigationControler.tabBarItem.title = title
//        navigationControler.tabBarItem.image = icon
        rootViewController.navigationItem.title = title
        
        return navigationControler
    }
}
