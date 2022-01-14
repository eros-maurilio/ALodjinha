import UIKit

enum WindowFactory {
    
    enum tabIndex {
        static let home = 0
        static let about = 1
    }
    
    static func make(with window: UIWindow?) {
        let tabController = TabBarController()
        
        tabController.selectedIndex = tabIndex.home
        window?.rootViewController = tabController
        window?.makeKeyAndVisible()
        
    }
}
