import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var bannerView: UIView!
    
    private let numOfItems = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        (bannerView as? BannerViewWrapper)?.contentView.isViewCreated = true
        
        setupNavBar()
        
    }
}

private extension HomeViewController {
    func setupNavBar() {
        let logo = UIImage(named: "NavBar")
        let frame = CGRect(x: 0, y: 0, width: 125, height: 33)
        let imageView = UIImageView(image: logo)
        imageView.frame = frame
        
        navigationItem.titleView = imageView
    }
}
