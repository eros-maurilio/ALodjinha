import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - NibsWrapped / IBOutlets pairs
    
    @NibWrapped(BannerView.self)
    @IBOutlet private var bannerViewHolder: UIView!
    
    @NibWrapped(CategoriesView.self)
    @IBOutlet private var categoriesViewHolder: UIView!
    
    @NibWrapped(TopSellersView.self)
    @IBOutlet private var topSellersViewHolder: UIView!
    
    
    // MARK: View's LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        setupSubviewComponents()
    }
}

    // MARK: - Private Methods

private extension HomeViewController {
    
    func setupSubviewComponents() {
        _bannerViewHolder.unwrapped.setup()
        _categoriesViewHolder.unwrapped.setup()
        _topSellersViewHolder.unwrapped.setup()
        
        setupSubviewsDelegate()
    }
    
    func setupSubviewsDelegate() {
        _categoriesViewHolder.unwrapped.delegate = self
        _topSellersViewHolder.unwrapped.delegate = self
    }
    
    func setupNavBar() {
        let logo = UIImage(named: "NavBar")
        let frame = CGRect(x: 0, y: 0, width: 125, height: 33)
        let imageView = UIImageView(image: logo)
        imageView.frame = frame
        
        navigationItem.titleView = imageView
    }
}

    // MARK: - PushViewDelegate

extension HomeViewController: PushViewDelegate {
    
    func didPush(view: UIViewController) {
        view.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(view, animated: true)
    }
}
