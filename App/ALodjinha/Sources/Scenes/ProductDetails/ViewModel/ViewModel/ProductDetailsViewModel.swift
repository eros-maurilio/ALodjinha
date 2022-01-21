import Foundation

typealias ProductsDetailsResult = Result<DataModel, NSError>

final class ProductDetailsViewModel: ProductDetailsViewModelProtocol {
    
    // MARK: - Attributes
    
    private weak var delegate: DetailsDelegate?
    private var productDetailsData: DataModel?
    private var dataLoader = DataLoader()
    private var dataPost = DataPost()
    private var productID = String()
    
    // MARK: - Computed Variable
    
    var navTitle: String { navigationTitle() }
    
    // MARK: - Dependencies
    
    init(delegate: DetailsDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Public Methods
    
    func loadFromAPI(productID id: String) {
        productID = id
        
        dataLoader.request(.getURLRequestWithPath(["produto"], id: productID)) { [weak self] (result: ProductsDetailsResult) in
            guard let self = self else { return }
            
            switch result {
            case let .success(response):
                self.productDetailsData = response
                self.delegate?.didLoad()
            case let .failure(error):
                debugPrint(error)
            }
        }
    }
    
    func dtoForViews() -> ProductDetailsDTO {
        let item = productDetailsData
        
        return ProductDetailsDTO(name: item?.productName ?? "",
                                 imageURL: item?.urlImage ?? "",
                                 oldPrice: item?.oldPrice ?? 0,
                                 newPrice: item?.newPrice ?? 0,
                                 description: item?.productDescription ?? "")
    }
    
    func booking() {
        dataPost.makePostRequest(id: productID) { (result: Result<String, NSError>) in
            switch result {
            case let .success(response):
                self.delegate?.alertHandler(message: response)
                
            case let .failure(error):
                self.delegate?.alertHandler(message: error.localizedDescription)
            }
        }
    }
    
    // MARK: - Helper method
    
    private func navigationTitle() -> String {
        productDetailsData?.category?.categoryName ?? ""
    }
}
