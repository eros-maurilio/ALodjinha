import Foundation

final class CategoriesViewModel: TableCollectionViewModelProtocol {
    
    private weak var delegate: LoadContentable?
    private var dataLoader = DataLoader()
    private var categoriesData: [DataModel]?
   
    init(delegate: LoadContentable) {
        self.delegate = delegate
    }
    
    func loadFromAPI() {
        dataLoader.request(.getURLRequestWithPath(["categoria"])) { [weak self] (result: APIResult) in
            guard let self = self else { return }
            
            switch result {
            case let .success(response):
                self.categoriesData = response.data
                self.delegate?.didLoad()
            case let .failure(error):
                debugPrint(error)
            }
        }
    }
    
    func numberOfSections() -> Int {
        return [categoriesData].count
    }
    
    func numberOfItems() -> Int {
        guard let categoriesCount = categoriesData?.count else { return 0 }
        return categoriesCount
    }
    
    func dtoForItems(indexPath: IndexPath) -> Any {
        let itemAtIndexPaht = categoriesData![indexPath.item]
        let imageURL = itemAtIndexPaht.urlImage
        let categorieName = itemAtIndexPaht.productDescription
        
        return CategoryCellDTO(imageURL: imageURL, name: categorieName ?? "")
    }
    
    func show(id: String) {
        delegate?.showMore(id: id)
    }
    
    func transporter(_ indexPath: IndexPath) -> String {
        return String(categoriesData![indexPath.row].id)
    }
    
}
