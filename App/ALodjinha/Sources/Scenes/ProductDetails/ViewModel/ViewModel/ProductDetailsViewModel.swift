import Foundation

typealias ProductsDetailsResult = Result<DataModel, NSError>

final class ProductDetailsViewModel: ProductDetailsViewModelProtocol {
    
    // MARK: - Attributes
    
    private weak var delegate: SearchViewDelegate?
    private var productDetailsData: DataModel?
    private var dataLoader = DataLoader()
    
    // MARK: - Computed Variable
    
    var navTitle: String { navigationTitle() }
    
    // MARK: - Dependencies
    
    init(delegate: SearchViewDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Public Methods
    
    func loadFromAPI(productID id: String) {
        dataLoader.request(.getURLRequestWithPath(["produto"], id: id)) { [weak self] (result: ProductsDetailsResult) in
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
        
    }
    
    // MARK: - Helper method
    
    private func navigationTitle() -> String {
        productDetailsData?.category?.categoryName ?? ""
    }
}
