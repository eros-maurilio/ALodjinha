import Foundation

final class CategoryViewModel: CategoryViewModelProtocol {
    // MARK: - Attributes
    
    private weak var delegate: CategoryDelegate?
    private var categoryData = [DataModel]()
    private let dataLoader: DataLoaderProtocol
    private var itemAtIndexPath = String()
    
    
    // MARK: - Computed Variable
    
    var navTitle: String { navigationTitle() }
    
    // MARK: - Dependencies
    
    init(dataLoader: DataLoaderProtocol, delegate: CategoryDelegate?) {
        self.dataLoader = dataLoader
        self.delegate = delegate
    }
    
    // MARK: - Public Methods
    
    func loadFromAPI(id: String) {
        dataLoader.make(.urlRequestWithQuery(path: Strings.URL.productPath, query: id)) { [weak self] (result: APIResult) in
            guard let self = self else { return }
            
            switch result {
                
            case let .success(response):
                self.categoryData = response.data
                if !self.categoryData.isEmpty {
                    self.delegate?.didLoad(success: true)
                } else {
                    self.delegate?.didLoad(success: false)
                }
                
            case let .failure(error):
                self.delegate?.didLoad(success: false)
                debugPrint(error)
            }
        }
    }
    
    func numberOfSections() -> Int { 1 }
    
    func numberOfItems() -> Int { categoryData.count }
    
    func dtoForItems(indexPath: IndexPath) -> CategoryTableCellDTO {
        let itemAtIndexPath = categoryData[indexPath.row]
        let imageURL = itemAtIndexPath.urlImage
        let name = itemAtIndexPath.productName
        let oldPrice = itemAtIndexPath.oldPrice
        let newPrice = itemAtIndexPath.newPrice
 
        return CategoryTableCellDTO(imageURL: imageURL,
                             name: name ?? "",
                             oldPrice: oldPrice ?? 0,
                             newPrice: newPrice ?? 0)
        
    }
    
    func showCategory(id: String) {
        delegate?.showMore(id: id)
    }
    
    func transporter(_ indexPath: IndexPath) -> String {
        return String(categoryData[indexPath.row].id)
    }
    
    // MARK: - Helper Method
    
    private func navigationTitle() -> String {
        categoryData.first?.category?.categoryName ?? ""
    }
}
