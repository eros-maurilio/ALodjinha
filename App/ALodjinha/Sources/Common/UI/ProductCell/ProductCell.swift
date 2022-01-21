import UIKit

class ProductCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var productImage: ImageCacherView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var oldPrice: UILabel!
    @IBOutlet weak var newPrice: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    weak var delegate: cellDelegate?
    
    // MARK: - Public Method
    
    override func prepareForReuse() {
        productImage.cancel()
        productImage.image = nil
    }
    
    func fill(dto: CategoryTableCellDTO) {
        productImage.downloadImage(withURL: dto.imageURL)
        productImage.delegate = self
        name.text = dto.name
        oldPrice.text = "De: \(String(dto.oldPrice))"
        newPrice.text = "Por \(String(dto.newPrice))"
    }
    
    func startLoading() {
        productImage.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
        productImage.isHidden = false
    }
}

extension ProductCell: cellDelegate {
    func startLoad() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.startLoad()
        }
    }
    
    func stopLoad() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.stopLoading()

        }
    }
}
