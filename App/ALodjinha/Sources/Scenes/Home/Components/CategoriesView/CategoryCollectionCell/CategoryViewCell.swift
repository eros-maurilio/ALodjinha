import UIKit

protocol ImageCacherDelegate: AnyObject {
    func startLoad()
    func stopLoad()
}

class CategoryViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var categoryImage: ImageCacherView!
    @IBOutlet private weak var categoryName: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var cellView: ImageCacherView!
    
    // MARK: - Public Method
    
    override func prepareForReuse() {
        cellView.taskCanceller()
        cellView.image = nil
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

extension CategoryViewCell: ImageCacherDelegate {
    func startLoad() {
        DispatchQueue.main.async { [weak self] in
            self?.startLoad()
        }
    }
    
    func stopLoad() {
        DispatchQueue.main.async { [weak self] in
            self?.stopLoading()
            
            if self?.categoryImage == nil {
                self?.categoryImage.image = UIImage(named: "Placeholder")

            }
        }
    }
}
