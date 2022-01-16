import UIKit

@IBDesignable class BannerViewWrapper: NibWrapperView<BannerView> { }

class BannerView: UIView {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var layout: UICollectionViewFlowLayout!
    
    // MARK: - Public Method
    
    func setup() {
        registerCell()
        setupViewComponents()
    }
}

    // MARK: - Private Methods

private extension BannerView {
    
    func registerCell() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BannerViewCell.self)
    }
    
    func collectionCell(_ collectionView: UICollectionView, at indexPath: IndexPath, forACellDTO aCellDTO: BannerCellDTO) -> BannerViewCell {
        let cell = collectionView.dequeueCell(BannerViewCell.self, indexPath)
        cell.fillCell(dto: aCellDTO)
        
        return cell
    }
    
    func setupViewComponents() {
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 150)
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

    // MARK: - UICollectionViewDataSource

extension BannerView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionCell(collectionView, at: indexPath, forACellDTO: BannerCellDTO(image: UIImage(named: "axlPlaceHolder")!))
    }
}

    // MARK: - UICollectionViewDelegate

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
