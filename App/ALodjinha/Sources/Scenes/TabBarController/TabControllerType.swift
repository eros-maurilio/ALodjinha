import UIKit

extension TabBarController {
    
    enum TabControllerType {
        case home, about
        
        var view: UIViewController {
            switch self {
            case .home:
                return HomeViewController()
            case .about:
                return AboutViewController()
            }
        }
        
        var title: String {
            switch self {
            case .home:
                return Strings.Title.home
            case .about:
                return Strings.Title.about
            }
        }
        
        var icon: UIImage {
            switch self {
            case .home:
                return UIImage(named: "home") ?? UIImage()
            case .about:
                return UIImage(named: "tag") ?? UIImage()
            }
        }
    }
}
