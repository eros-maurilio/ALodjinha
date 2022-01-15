import UIKit

@IBDesignable class BannerViewWrapper: NibWrapperView<BannerView> { }

class BannerView: UIView {
    
    @IBOutlet weak var testImage: UIImageView!
    
    var image: String = "" {
        didSet {
            testImage.image = UIImage(named: image)
        }
    }
}
