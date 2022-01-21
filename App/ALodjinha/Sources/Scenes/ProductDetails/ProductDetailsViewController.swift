import UIKit

protocol DetailsDelegate: SearchViewDelegate {
    func didLoad()
    func alertHandler(message: String)
}

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
                 let newFont = UIFont(descriptor: newFontDescriptor, size: 16)
                newAttributedString.addAttributes([NSAttributedString.Key.font: newFont], range: range)
             }
        }
        return newAttributedString
    }
    
    func buttonShadow() {
        bookingButton.layer.shadowColor = UIColor.darkGray.cgColor
        bookingButton.layer.shadowRadius = 5
        bookingButton.layer.shadowOpacity = 0.5
        bookingButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        bookingButton.layer.shadowPath = UIBezierPath(rect: bookingButton.bounds).cgPath
    }
    
    func setupAlert(message: String) {
        let alert = UIAlertController(title: "Mensagem", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: popView))
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

    // MARK: - SearchViewDelegate

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


