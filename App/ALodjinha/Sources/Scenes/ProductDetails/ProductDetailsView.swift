import UIKit

class ProductDetailsView: UIViewController {
    @IBOutlet private weak var productImage: UIImageView!
    @IBOutlet private weak var productName: UILabel!
    @IBOutlet private weak var oldPrice: UILabel!
    @IBOutlet private weak var newPrice: UILabel!
    @IBOutlet private weak var productDescription: UILabel!
    @IBOutlet private weak var bookingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
