import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - NibsWrapped
    
    @NibWrapped(BannerView.self)
    
    // MARK: - IBOutlets
    
    @IBOutlet private var bannerViewHolder: UIView!
        
    // MARK: View's LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue

        setupNavBar()
        setupSubviewComponents()
    }
}

    // MARK: - Private Methods

private extension HomeViewController {
    
    func setupSubviewComponents() {
        let bannerView = _bannerViewHolder.unwrapped
        
        bannerView.setup()
    }
    
    func setupNavBar() {
        let logo = UIImage(named: "NavBar")
        let frame = CGRect(x: 0, y: 0, width: 125, height: 33)
        let imageView = UIImageView(image: logo)
        imageView.frame = frame
        
        navigationItem.titleView = imageView
    }
}
