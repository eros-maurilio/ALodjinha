import UIKit

@IBDesignable class CategoriesViewWrapper: NibWrapperView<CategoriesView> { }

class CategoriesView: UIView {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    
    func setup() {
        register()
        setupViewComponents()
    }
}

private extension CategoriesView {
    func register() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoryViewCell.self)
    }
    
    func collectionCell(_ collectionView: UICollectionView, at indexPath: IndexPath, forACellDTO ACellDTO: categoryCellDTO) -> CategoryViewCell {
        let cell = collectionView.dequeueCell(CategoryViewCell.self, indexPath)
        cell.fill(dto: ACellDTO)
        
        return cell
    }
    
    func setupViewComponents() {
        layout.itemSize = CGSize(width: 80, height: 100)
    }
}

extension CategoriesView: UICollectionViewDelegate { }

extension CategoriesView: UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionCell(collectionView, at: indexPath, forACellDTO: categoryCellDTO(image: UIImage(named: "axlPlaceHolder")!, name: "Categoria"))
    }
    
}
