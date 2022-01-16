import UIKit

struct categoryCellDTO {
    let image: UIImage
    let name: String
}

class CategoryViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var categoryImage: UIImageView!
    @IBOutlet private weak var categoryName: UILabel!

    func fill(dto: categoryCellDTO) {
        categoryImage.image = dto.image
        categoryName.text = dto.name
    }
}
