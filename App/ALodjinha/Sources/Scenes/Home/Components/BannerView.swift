import UIKit

@IBDesignable class BannerViewWrapper: NibWrapperView<BannerView> { }

class BannerView: UIView {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    
    var isViewCreated = false {
        didSet {
            if isViewCreated && collectionView != nil {
                setupView()
            }
        }
    }
    
    func setupView() {
        registerCell(for: collectionView)
        configureView()
    }
}

private extension BannerView {
    
    func registerCell(for: UICollectionView) {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BannerViewCell.self)
    }
    
    func collectionCell(_ collectionView: UICollectionView, at indexPath: IndexPath, forACellDTO aCellDTO: BannerCellDTO) -> BannerViewCell {
        let cell = collectionView.dequeueCell(BannerViewCell.self, indexPath)
        cell.fillCell(dto: aCellDTO)
        
        return cell
    }
    
    func configureView() {
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
        pageControl.numberOfPages = 3
    }
    
    func getCurrentCellIndex() -> Int {
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint) {
            return visibleIndexPath.row
        }
        
        return pageControl.currentPage
    }
}

extension BannerView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionCell(collectionView, at: indexPath, forACellDTO: BannerCellDTO(image: UIImage(named: "axlPlaceHolder")!))
    }
}

extension BannerView: UICollectionViewDelegate {
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
