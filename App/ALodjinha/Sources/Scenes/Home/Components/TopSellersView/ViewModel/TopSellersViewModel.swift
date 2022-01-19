import Foundation

typealias TopSellersResult = Result<BannerResponse, NSError>

final class TopSellersViewModel: TableCollectionViewModelProtocol {
    
    private weak var delegate: LoadContentable?
    private var topSellersData: [DataModel]?
    private var dataLoader = DataLoader()
    
    init(delegate: LoadContentable) {
        self.delegate = delegate
    }

    func loadFromAPI() {
        dataLoader.request(.getRequestURL(["produto", "maisvendidos"])) { [weak self] (result: TopSellersResult) in
            guard let self = self else { return }
            
            switch result {
                
            case let .success(response):
                self.topSellersData = response.data
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
        guard let topSellersCount = topSellersData?.count else { return 0 }
    
        return topSellersCount
    }
    
    func dtoForItems(indexPath: IndexPath) -> Any {
        let itemAtIndexPath = topSellersData![indexPath.row]
        let imageURL = itemAtIndexPath.urlImagem
        let title = itemAtIndexPath.nome
        let oldPrice = itemAtIndexPath.precoDe
        let newPrice = itemAtIndexPath.precoPor
        
        return TopSellersDTO(imageURL: imageURL, name: title ?? "", oldPrice: oldPrice ?? 0.0, newPrice: newPrice ?? 0.0)
    }
    
    func show(id: String) {
        
    }
    
    func transporter(_ indexPath: IndexPath) -> String {
       return ""
    }
}
