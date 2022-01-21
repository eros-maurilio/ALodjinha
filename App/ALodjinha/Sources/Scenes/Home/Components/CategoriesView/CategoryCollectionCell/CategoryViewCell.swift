import UIKit

protocol ImageCacherDelegate: AnyObject {
    func startLoad()
    func stopLoad()
}

class CategoryViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var categoryImage: ImageCacherView!
    @IBOutlet private weak var categoryName: UILabel!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var cellView: UIView!
    
    // MARK: - Public Method
    
    override func prepareForReuse() {
        categoryImage.taskCanceller()
        categoryImage.image = nil
    }
    
    func fill(dto: CategoryCollectionDTO) {
        categoryImage.downloadImage(withURL: dto.imageURL)
        categoryImage.delegate = self
        categoryName.text = dto.name
    }
    
    func startLoading() {
        cellView.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
        cellView.isHidden = false
    }
}

    // MARK: - ImageCacherDelegate

extension CategoryViewCell: ImageCacherDelegate {
    
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
