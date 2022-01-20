import UIKit

class CategoryViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var categoryImage: ImageCacherView!
    @IBOutlet private weak var categoryName: UILabel!

    // MARK: - Public Method
    
    func fill(dto: CategoryCollectionDTO) {
        categoryImage.downloadImage(withURL: dto.imageURL)
        
        if categoryImage.image == nil {
            categoryImage.image = UIImage(named: "Placeholder")
        }
        categoryName.text = dto.name
    }
}
