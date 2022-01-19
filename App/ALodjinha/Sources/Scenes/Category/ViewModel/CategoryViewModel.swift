import Foundation

final class CategoryViewModel: CategoryViewModelProtocol {
    
    // MARK: - Attributes
    
    private weak var delegate: LoadContentable?
    private var categoryData = [DataModel]()
    private var dataLoader = DataLoader()
    private var itemAtIndexPath = String()
    
    // MARK: - Computed Variable
    
    var navTitle: String { navigationTitle() }
    
    // MARK: - Dependencies
    
    init(delegate: LoadContentable) {
        self.delegate = delegate
    }
    
    // MARK: - Public Methods
    
    func loadFromAPI(id: String) {
        dataLoader.request(.getURLRequestWithQuery(path: "/produto", query: id)) { [weak self] (result: APIResult) in
            
            guard let self = self else { return }
            
            switch result {
                
            case let .success(response):
                self.categoryData = response.data
                self.delegate?.didLoad()
            case let .failure(error):
                debugPrint(error)
            }
        }
    }
    
    func numberOfSections() -> Int {
        return [categoryData].count
    }
    
    func numberOfItems() -> Int {
        return categoryData.count
    }
    
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
    
    func navigationTitle() -> String {
        categoryData.first?.category?.categoryName ?? ""
    }
}
