import UIKit

struct BannerCellDTO {
    let imageURL: String
}

class BannerViewCell: UICollectionViewCell {
   
    // MARK: - IBOutlets
    
    @IBOutlet private weak var bannerImage: ImageCacher!
    
    // MARK: - Public Method
    
    func fillCell(dto: BannerCellDTO) {
        bannerImage.downloadImage(withURL: dto.imageURL)
        
    }
}

