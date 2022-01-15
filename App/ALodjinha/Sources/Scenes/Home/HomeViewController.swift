import UIKit

class HomeViewController: UIViewController {
    @IBOutlet private weak var bannerCollection: UICollectionView!
    @IBOutlet private weak var layout: UICollectionViewFlowLayout!
    @IBOutlet private weak var pageControl: UIPageControl!
    
    private let numOfItems = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        
        setupNavBar()
        registerCell(for: bannerCollection)
        configureView()

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
    
    func registerCell(for: UICollectionView) {
        bannerCollection.dataSource = self
        bannerCollection.delegate = self
        bannerCollection.register(BannerViewCell.self)
    }
    
    func collectionCell(_ collectionView: UICollectionView, at indexPath: IndexPath, forACellDTO aCellDTO: BannerCellDTO) -> BannerViewCell {
        let cell = collectionView.dequeueCell(BannerViewCell.self, indexPath)
        cell.fillCell(dto: aCellDTO)
        
        return cell
    }
    
    func configureView() {
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: bannerCollection.bounds.size.height)
        pageControl.numberOfPages = numOfItems
    }
    
    func getCurrentCellIndex() -> Int {
        let visibleRect = CGRect(origin: bannerCollection.contentOffset, size: bannerCollection.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = bannerCollection.indexPathForItem(at: visiblePoint) {
            return visibleIndexPath.row
        }
        
        return pageControl.currentPage
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionCell(collectionView, at: indexPath, forACellDTO: BannerCellDTO(image: UIImage(named: "axlPlaceHolder")!))
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = getCurrentCellIndex()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        pageControl.currentPage = getCurrentCellIndex()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = getCurrentCellIndex()
    }
}
