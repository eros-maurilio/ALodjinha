import UIKit

struct BannerCellDTO {
    let image: UIImage
}

class BannerViewCell: UICollectionViewCell {
   
    // MARK: - IBOutlets
    
    @IBOutlet private weak var bannerImage: UIImageView!
    
    // MARK: - Public Method
    
    func fillCell(dto: BannerCellDTO) {
        bannerImage.image = dto.image
    }
}

