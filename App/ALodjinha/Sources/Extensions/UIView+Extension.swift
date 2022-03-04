import UIKit

extension UIView {
    
    static func loadFromNib() -> Self {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: String(describing: self), bundle: bundle)
        
        return nib.instantiate(withOwner: nil, options: nil).first as! Self
    }
}
