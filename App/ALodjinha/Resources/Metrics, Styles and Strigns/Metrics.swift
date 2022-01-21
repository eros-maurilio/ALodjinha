import UIKit

enum Metrics {
    enum Banner {
        static let size = CGSize(width: UIScreen.main.bounds.width, height: 150)
    }
    
    enum TopSellers {
        static let rowSize: CGFloat = 80
    }
    
    enum Home {
        static let navIconFrame = CGRect(x: 0, y: 0, width: 125, height: 33)
    }
    
    enum TabController {
        static let iconSize = CGSize(width: 24, height: 21)
    }
    
    enum ProductDetails {
        static let bodyFontSize: CGFloat = 16
    }
}
