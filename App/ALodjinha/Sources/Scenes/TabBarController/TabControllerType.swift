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
                return Styles.Image.homeIcon ?? UIImage()
            case .about:
                return Styles.Image.aboutIcon ?? UIImage()
            }
        }
    }
}
