import UIKit

struct BannerCollectionCellDTO {
    let imageURL: String
}

class BannerViewCell: UICollectionViewCell {
   
    // MARK: - IBOutlets
    
    @IBOutlet private weak var bannerImage: ImageCacherView!
    
    // MARK: - Public Method
    
    func fillCell(dto: BannerCollectionCellDTO) {
        bannerImage.downloadImage(withURL: dto.imageURL)
    }
}

