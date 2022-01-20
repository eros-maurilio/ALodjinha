import UIKit

class ProductDetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var productImage: ImageCacherView!
    @IBOutlet private weak var productName: UILabel!
    @IBOutlet private weak var oldPrice: UILabel!
    @IBOutlet private weak var newPrice: UILabel!
    @IBOutlet private weak var productDescription: UILabel!
    @IBOutlet private weak var bookingButton: UIButton!
    
    // MARK: - Properties
    
    private lazy var viewModel: ProductDetailsViewModelProtocol = ProductDetailsViewModel(delegate: self)
    
    // MARK: - View's Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

    // MARK: - Public Methods

extension ProductDetailsViewController {
    func setupView(productID: String) {
        viewModel.loadFromAPI(productID: productID)
    }
}

    // MARK: Private Methods

private extension ProductDetailsViewController {
    
    func fillOutlets(dto: ProductDetailsDTO) {
        productName.text = dto.name
        productImage.downloadImage(withURL: dto.imageURL)
        oldPrice.text = "De: \(String(dto.oldPrice))"
        newPrice.text = "Por: \(String(dto.newPrice))"
        productDescription.text = dto.description
    }
    
    func setupNavigationBar() {
        navigationItem.title = viewModel.navTitle
    }
}

    // MARK: - SearchViewDelegate

extension ProductDetailsViewController: SearchViewDelegate {
    func didLoad() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.fillOutlets(dto: self.viewModel.dtoForViews())
            self.setupNavigationBar()
        }
    }
}


