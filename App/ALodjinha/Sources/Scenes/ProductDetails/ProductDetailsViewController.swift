import UIKit

class ProductDetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var productImage: ImageCacherView!
    @IBOutlet private weak var productName: UILabel!
    @IBOutlet private weak var oldPrice: UILabel!
    @IBOutlet private weak var newPrice: UILabel!
    @IBOutlet private weak var productDescription: UILabel!
    @IBOutlet private weak var bookingButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var activityIndicatorLarge: UIActivityIndicatorView!
    @IBOutlet weak var imageActivityindicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    
    private lazy var viewModel: ProductDetailsViewModelProtocol = ProductDetailsViewModel(delegate: self)
    
    weak var delegate: cellDelegate?
    
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
        productImage.delegate = self
        productName.text = dto.name
        productImage.downloadImage(withURL: dto.imageURL)
        oldPrice.text = "De: \(String(dto.oldPrice))"
        newPrice.text = "Por: \(String(dto.newPrice))"
        productDescription.attributedText = setupAttributedString(dto.description)
    }
    
    func setupNavigationBar() {
        navigationItem.title = "Produto"
    }
    
    func stopLoading() {
        activityIndicatorLarge.stopAnimating()
        contentView.isHidden = false
    }
    
    func setupAttributedString(_ str: String) -> NSAttributedString {
        let transformed = transformToAttributedString(str)
        return styleAttributedString(transformed)
    }
    
    func transformToAttributedString(_ string: String) -> NSAttributedString {
            let atributtedString = try? NSAttributedString(
                data: string.data(using: String.Encoding.unicode, allowLossyConversion: true)!,
                options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
            
            return atributtedString!
    }
    
    func styleAttributedString(_ attributedStr: NSAttributedString) -> NSAttributedString {
        let newAttributedString = NSMutableAttributedString(attributedString: attributedStr)
        
        newAttributedString.enumerateAttribute(.font, in: NSMakeRange(0, newAttributedString.length), options: []) { value, range, _ in
            guard let currentFont = value as? UIFont else { return }
            
            let fontDescriptor = currentFont.fontDescriptor.addingAttributes([.family: "Helvetica Neue"])
            
            if let newFontDescriptor = fontDescriptor.matchingFontDescriptors(withMandatoryKeys: [UIFontDescriptor.AttributeName.family]).first {
                 let newFont = UIFont(descriptor: newFontDescriptor, size: 16)
                newAttributedString.addAttributes([NSAttributedString.Key.font: newFont], range: range)
             }
        }
        return newAttributedString
    }
}

    // MARK: - SearchViewDelegate

extension ProductDetailsViewController: SearchViewDelegate {
    func didLoad() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.fillOutlets(dto: self.viewModel.dtoForViews())
            self.setupNavigationBar()
            self.stopLoading()
        }
    }
}

extension ProductDetailsViewController: cellDelegate {
    
    func startLoad() {
        productImage.isHidden = true
        imageActivityindicator.startAnimating()
    }
    
    func stopLoad() {
        imageActivityindicator.stopAnimating()
        productImage.isHidden = false
    }
}


