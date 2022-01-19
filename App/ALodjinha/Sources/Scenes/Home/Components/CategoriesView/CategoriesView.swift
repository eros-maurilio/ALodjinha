import UIKit

@IBDesignable class CategoriesViewWrapper: NibWrapperView<CategoriesView> { }

class CategoriesView: UIView {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var layout: UICollectionViewFlowLayout!
    
    // MARK: - Properties
    
    weak var delegate: ViewDelegate?
    private lazy var viewModel: CategoriesViewModelProtocol = CategoriesViewModel(delegate: self)
    
    // MARK: - Public Method
    
    func setup() {
        viewModel.loadFromAPI()
    }
}

    // MARK: - Private Methods

private extension CategoriesView {

    func register() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoryViewCell.self)
    }
    
    func collectionCell(_ collectionView: UICollectionView, at indexPath: IndexPath, forACellDTO ACellDTO: CategoryCollectionDTO) -> CategoryViewCell {
        let cell = collectionView.dequeueCell(CategoryViewCell.self, indexPath)
        cell.fill(dto: ACellDTO)
        
        return cell
    }
    
    func setupViewComponents() {
        layout.itemSize = CGSize(width: 80, height: 100)
    }
    
    func sendView(_ view: UIViewController) {
        delegate?.didPush(view: view)
    }
}

    // MARK: - UICollectionViewDelegate

extension CategoriesView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.show(id: viewModel.transporter(indexPath))
    }
}

    // MARK: - UICollectionViewDataSource

extension CategoriesView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionCell(collectionView, at: indexPath, forACellDTO: viewModel.dtoForItems(indexPath: indexPath))
    }    
}

    // MARK: - ViewDelegate

extension CategoriesView: LoadContentable {
    
    func didLoad() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.register()
            self.collectionView.reloadData()
            self.setupViewComponents()
        }
    }
    
    func showMore(id: String) {
        let viewController = CategoryViewController()
        viewController.setup(categoryID: id)
        sendView(viewController)
    }    
}
