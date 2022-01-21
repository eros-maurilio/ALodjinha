import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - NibsWrapped / IBOutlets pairs
    
    @NibWrapped(BannerView.self)
    @IBOutlet private var bannerViewHolder: UIView!
    
    @NibWrapped(CategoriesView.self)
    @IBOutlet private var categoriesViewHolder: UIView!
    
    @NibWrapped(TopSellersView.self)
    @IBOutlet private var topSellersViewHolder: UIView!
    
    @IBOutlet private var homeContentView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    // MARK: View's LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

    // MARK: - Private Methods

private extension HomeViewController {
    
    func setup() {
        setupNavBar()
        setupSubviewComponents()
        
        bannerViewHolder.layer.shadowColor = UIColor.black.cgColor
        bannerViewHolder.layer.shadowRadius = 10
        bannerViewHolder.layer.shadowOpacity = 1
        bannerViewHolder.layer.shadowPath = UIBezierPath(rect: bannerViewHolder.bounds).cgPath
    }
    
    func setupSubviewComponents() {
        _bannerViewHolder.unwrapped.setup()
        _categoriesViewHolder.unwrapped.setup()
        _topSellersViewHolder.unwrapped.setup()
        
        setupSubviewsDelegate()
    }
    
    func setupSubviewsDelegate() {
        _categoriesViewHolder.unwrapped.delegate = self
        _topSellersViewHolder.unwrapped.delegate = self
        _bannerViewHolder.unwrapped.delegate = self
    }
    
    func setupNavBar() {
        let logo = UIImage(named: "NavBar")
        let frame = CGRect(x: 0, y: 0, width: 125, height: 33)
        let imageView = UIImageView(image: logo)
        imageView.frame = frame
        
        navigationItem.title = Strings.Title.home
        navigationItem.titleView = imageView
    }
    
    func stopLoading() {
        homeContentView.isHidden = false
        activityIndicator.stopAnimating()
    }
}

    // MARK: - PushViewDelegate

extension HomeViewController: HomeViewDelegate {
    
    func didPush(view: UIViewController) {
        view.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(view, animated: true)
        self.stopLoading()
    }
    
    func didLoad() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.stopLoading()
        }
    }
}
