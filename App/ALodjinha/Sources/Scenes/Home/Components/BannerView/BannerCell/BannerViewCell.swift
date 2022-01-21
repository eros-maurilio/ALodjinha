import UIKit

struct BannerCollectionCellDTO {
    let imageURL: String
}

class BannerViewCell: UICollectionViewCell {
   
    // MARK: - IBOutlets
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var bannerImage: ImageCacherView!
    
    // MARK: - Public Method
    
    func fillCell(dto: BannerCollectionCellDTO) {
        bannerImage.delegate = self
        bannerImage.downloadImage(withURL: dto.imageURL)
    }
    
    func startLoading() {
        bannerImage.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
        bannerImage.isHidden = false
    }
}

    // MARK: - ImageCacherDelegate

extension BannerViewCell: ImageCacherDelegate {
    func startLoad() {
        DispatchQueue.main.async { [weak self] in
            self?.startLoad()
        }
    }
    
    func stopLoad() {
        DispatchQueue.main.async { [weak self] in
            self?.stopLoading()
        }
    }
}

