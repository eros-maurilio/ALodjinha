import UIKit

struct BannerCellDTO {
    let image: UIImage
}

class BannerViewCell: UICollectionViewCell {
   
    @IBOutlet private weak var bannerImage: UIImageView!
    
    func fillCell(dto: BannerCellDTO) {
        bannerImage.image = dto.image
    }
}

