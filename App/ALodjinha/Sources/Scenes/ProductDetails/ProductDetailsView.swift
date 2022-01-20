import UIKit

struct ProductDetailsDTO {
    let name: String
    let imageURL: String
    let oldPrice: Float
    let newPrice: Float
    let description: String
}

class ProductDetailsView: UIViewController {
    
    @IBOutlet private weak var productImage: ImageCacherView!
    @IBOutlet private weak var productName: UILabel!
    @IBOutlet private weak var oldPrice: UILabel!
    @IBOutlet private weak var newPrice: UILabel!
    @IBOutlet private weak var productDescription: UILabel!
    @IBOutlet private weak var bookingButton: UIButton!
    
    private lazy var viewModel: ProductDetailsViewModelProtocol = ProductDetailsViewModel(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension ProductDetailsView {
    func setupView(id: String) {
        viewModel.loadFromAPI(productID: id)
    }
}

private extension ProductDetailsView {
    
    func fillOutlets(dto: ProductDetailsDTO) {
        productName.text = dto.name
        productImage.downloadImage(withURL: dto.imageURL)
        oldPrice.text = String(dto.oldPrice)
        newPrice.text = String(dto.newPrice)
        productDescription.text = dto.description
    }
    
    func setupNavigationBar() {
        navigationItem.title = viewModel.navTitle
    }
}

extension ProductDetailsView: LoadContentable {
    func showMore(id: String) {
        
    }
    
    func didLoad() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.fillOutlets(dto: self.viewModel.dtoForViews())
            self.setupNavigationBar()
        }
    }
}


