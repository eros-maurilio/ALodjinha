import UIKit

enum Styles { // namespacing
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

extension UIView {
    func makeShadow(color: UIColor, radius: CGFloat, opacity: Float, offSet: CGSize) {
        
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        
    }
}
