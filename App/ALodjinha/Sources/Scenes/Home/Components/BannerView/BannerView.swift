import UIKit

@IBDesignable class BannerViewWrapper: NibWrapperView<BannerView> { }

class BannerView: UIView {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var layout: UICollectionViewFlowLayout!
    
    private lazy var viewModel: TableCollectionViewModelProtocol = BannerViewModel(delegate: self)
    
    // MARK: - Public Method
    
    func setup() {
        registerCell()
        viewModel.loadFromAPI()
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
        pageControl.numberOfPages = viewModel.numberOfItems()
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

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionCell(collectionView, at: indexPath, forACellDTO: viewModel.dtoForItems(indexPath: indexPath) as! BannerCellDTO)
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

extension BannerView: LoadContentable {
    
    func didLoad() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
            self.setupViewComponents()

        }
    }
    
    func showMore() {
        
    }
}
