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
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
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
        
        Styles.makeShadowFor(bannerViewHolder,
                             color: .black,
                             radius: 10,
                             opacity: 1,
                             offSet: .zero)
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
        let logo = Styles.Image.logo
        let frame = Metrics.Home.navIconFrame
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
