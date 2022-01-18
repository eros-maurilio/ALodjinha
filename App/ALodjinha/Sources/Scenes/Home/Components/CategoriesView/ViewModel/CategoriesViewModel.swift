import Foundation

typealias CategoriesResult = Result<BannerResponse, NSError>

final class CategoriesViewModel: TableCollectionViewModelProtocol {
    
    private weak var delegate: LoadContentable?
    private var dataLoader = DataLoader()
    private var categoriesData: [DataModel]?
   
    init(delegate: LoadContentable) {
        self.delegate = delegate
    }
    
    func loadFromAPI() {
        dataLoader.request(.getRequestURL(["categoria"])) { [weak self] (result: CategoriesResult) in
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
        let imageURL = itemAtIndexPaht.urlImagem
        let categorieName = itemAtIndexPaht.descricao
        
        return CategoryCellDTO(imageURL: imageURL, name: categorieName ?? "")
    }
    
    func transporter(_ indexPath: IndexPath) -> String {
        ""
    }
    
}
