import UIKit

class ProductCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var productImage: ImageCacherView!
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var oldPrice: UILabel!
    @IBOutlet private weak var newPrice: UILabel!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Attributes
    
    weak var delegate: ImageCacherDelegate?
    
    // MARK: - Override Cell Method
    
    override func prepareForReuse() {
        productImage.taskCanceller()
        productImage.image = nil
    }
}

    // MARK: - Public Methods

extension ProductCell {
    
    func fill(dto: CategoryTableCellDTO) {
        productImage.downloadImage(withURL: dto.imageURL)
        productImage.delegate = self
        name.text = dto.name
        oldPrice.text = "De: \(String(dto.oldPrice))"
        newPrice.text = "Por \(String(dto.newPrice))"
    }
}

    // MARK: - Private Methods

private extension ProductCell {
    
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

    // MARK: - ImageCacherDelegate

extension ProductCell: ImageCacherDelegate {
    
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
