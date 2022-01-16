import UIKit

struct categoryCellDTO {
    let image: UIImage
    let name: String
}

class CategoryViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var categoryImage: UIImageView!
    @IBOutlet private weak var categoryName: UILabel!

    // MARK: - Public Method
    
    func fill(dto: categoryCellDTO) {
        categoryImage.image = dto.image
        categoryName.text = dto.name
    }
}
