import Foundation

final class CategoriesViewModel: CategoriesViewModelProtocol {
    
    // MARK: - Attributes
    
    private weak var delegate: LoadContentable?
    private var dataLoader = DataLoader()
    private var categoriesData = [DataModel]()
   
    // MARK: - Dependencies
    
    init(delegate: LoadContentable) {
        self.delegate = delegate
    }
    
    // MARK: - Public Methods
    
    func loadFromAPI() {
        dataLoader.request(.getURLRequestWithPath([Strings.URL.categoryPath])) { [weak self] (result: APIResult) in
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
        return categoriesData.count
    }
    
    func dtoForItems(indexPath: IndexPath) -> CategoryCollectionDTO {
        let itemAtIndexPaht = categoriesData[indexPath.item]
        let imageURL = itemAtIndexPaht.urlImage
        let categorieName = itemAtIndexPaht.productDescription
        
        return CategoryCollectionDTO(imageURL: imageURL, name: categorieName ?? "")
    }
    
    func show(id: String) {
        delegate?.showMore(id: id)
    }
    
    func transporter(_ indexPath: IndexPath) -> String {
        return String(categoriesData[indexPath.row].id)
    }
}
