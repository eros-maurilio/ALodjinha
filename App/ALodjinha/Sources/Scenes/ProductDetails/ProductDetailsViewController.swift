import UIKit

class ProductDetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var productImage: ImageCacherView!
    @IBOutlet private weak var productName: UILabel!
    @IBOutlet private weak var oldPrice: UILabel!
    @IBOutlet private weak var newPrice: UILabel!
    @IBOutlet private weak var productDescription: UILabel!
    @IBOutlet private weak var bookingButton: UIButton!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var activityIndicatorLarge: UIActivityIndicatorView!
    @IBOutlet private weak var imageActivityindicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    
    private lazy var viewModel: ProductDetailsViewModelProtocol = ProductDetailsViewModel(delegate: self)
    weak var delegate: ImageCacherDelegate?
    
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
        navigationItem.title = Strings.Title.product
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
            
            let fontDescriptor = currentFont.fontDescriptor.addingAttributes([.family: Strings.Font.helvetica])
            
            if let newFontDescriptor = fontDescriptor.matchingFontDescriptors(withMandatoryKeys: [UIFontDescriptor.AttributeName.family]).first {
                let newFont = UIFont(descriptor: newFontDescriptor, size: Metrics.ProductDetails.bodyFontSize)
                newAttributedString.addAttributes([NSAttributedString.Key.font: newFont], range: range)
             }
        }
        return newAttributedString
    }
    
    func buttonShadow() {
        Styles.makeShadowFor(bookingButton,
                             color: .gray,
                             radius: 5,
                             opacity: 0.5,
                             offSet: CGSize(width: 0, height: 5))
    }
    
    func setupAlert(message: String) {
        let alert = UIAlertController(title: Strings.Alert.title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Strings.Alert.action, style: .default, handler: popView))
        self.present(alert, animated: true)
    }
    
    func popView(action: UIAlertAction? = nil) {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        bookingButton.backgroundColor = UIColor.gray
        bookingButton.isEnabled = false
        viewModel.booking()
    }
}

    // MARK: - DetailsDelegate

extension ProductDetailsViewController: DetailsDelegate {
    func alertHandler(message: String) {
        DispatchQueue.main.async { [weak self] in
            self?.setupAlert(message: message)
        }
    }
    
    func didLoad() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.fillOutlets(dto: self.viewModel.dtoForViews())
            self.setupNavigationBar()
            self.buttonShadow()
            self.stopLoading()
        }
    }
}

    // MARK: - ImageCacherDelegate


extension ProductDetailsViewController: ImageCacherDelegate {
    
    func startLoad() {
        productImage.isHidden = true
        imageActivityindicator.startAnimating()
    }
    
    func stopLoad() {
        imageActivityindicator.stopAnimating()
        productImage.isHidden = false
    }
}


