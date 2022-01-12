import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupViewController()
     
    }
}

private extension TabBarController {
    func setupViewController() {
        viewControllers = [
            createNavigationController(for: ViewController(), title: "Home"),
            createNavigationController(for: AboutController(), title: "About")
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
