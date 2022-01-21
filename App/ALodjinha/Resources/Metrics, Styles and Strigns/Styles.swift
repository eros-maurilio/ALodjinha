import UIKit

enum Styles {
    enum Image {
        static let placeholder = UIImage(named: "Placeholder")
        static let logo = UIImage(named: "NavBar")
        static let homeIcon = UIImage(named: "home")
        static let aboutIcon =  UIImage(named: "tag")
    }
    
    static func makeShadowFor(_ view: UIView, color: UIColor, radius: CGFloat, opacity: Float, offSet: CGSize) {
        
        view.layer.shadowColor = color.cgColor
        view.layer.shadowRadius = radius
        view.layer.shadowOpacity = opacity
        view.layer.shadowOffset = offSet
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        
    }
}
