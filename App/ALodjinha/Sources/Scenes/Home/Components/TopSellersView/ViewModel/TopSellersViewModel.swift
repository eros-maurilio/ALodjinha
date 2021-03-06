import Foundation

final class TopSellersViewModel: TopSellersViewModelProtocol {
    
    // MARK: - Attributes
    
    private weak var delegate: LoadContentable?
    private var topSellersData = [DataModel]()
    private var dataLoader = DataLoader()
    
    // MARK: - Dependencies
    
    init(delegate: LoadContentable?) {
        self.delegate = delegate
    }

    // MARK: - Public Methods

    func injectDataModel(_ dataModel: [DataModel]) {
        self.topSellersData = dataModel
    }
    
    func loadFromAPI() {
        dataLoader.make(.urlRequestWithPath([Strings.URL.productPath, Strings.URL.topSellersPath])) { [weak self] (result: APIResult) in
            guard let self = self else { return }
            
            switch result {
                
            case let .success(response):
                self.injectDataModel(response.data)
                self.delegate?.didLoad()
            case let .failure(error):
                debugPrint(error)
            }
        }
    }
    
    func numberOfSections() -> Int {
        return [topSellersData].count
    }
    
    func numberOfItems() -> Int {
        return topSellersData.count
    }
    
    func dtoForItems(indexPath: IndexPath) -> CategoryTableCellDTO {
        let itemAtIndexPath = topSellersData[indexPath.row]
        let imageURL = itemAtIndexPath.urlImage
        let title = itemAtIndexPath.productName
        let oldPrice = itemAtIndexPath.oldPrice
        let newPrice = itemAtIndexPath.newPrice
        
        return CategoryTableCellDTO(imageURL: imageURL, name: title ?? "", oldPrice: oldPrice ?? 0.0, newPrice: newPrice ?? 0.0)
    }
    
    func show(id: String) {
        delegate?.showMore(id: id)
    }
    
    func transporter(_ indexPath: IndexPath) -> String {
        return String(topSellersData[indexPath.row].id)
    }
}
