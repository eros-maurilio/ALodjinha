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
        let size = CGSize(width: 24, height: 21)
        
        if #available(iOS 10.0, *) {
            navigationController.tabBarItem.image = icon.upscale(targetSize: size)
        } else {
            navigationController.tabBarItem.image = tab.icon
        }
        
        navigationController.tabBarItem.title = tab.title
        navigationController.navigationBar.barTintColor = .purple
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController.navigationBar.tintColor = .white
        
        if #available(iOS 13.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithDefaultBackground()
            navigationBarAppearance.backgroundColor = .purple
            navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
        
        navigationController.navigationBar.layer.shadowColor = UIColor.black.cgColor
        navigationController.navigationBar.layer.shadowRadius = 20
        navigationController.navigationBar.layer.shadowOpacity = 1
        navigationController.navigationBar.layer.shadowPath = UIBezierPath(rect: navigationController.navigationBar.bounds).cgPath
        
        return navigationController
    }
}
