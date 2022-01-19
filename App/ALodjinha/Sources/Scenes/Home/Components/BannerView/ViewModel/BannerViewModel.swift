import UIKit

final class BannerViewModel: TableCollectionViewModelProtocol {
    
    private var bannerData: [DataModel]?
    private weak var delegate: LoadContentable?
    private var dataLoader = DataLoader()
    
    init(delegate: LoadContentable) {
        self.delegate = delegate
    }
    
    func loadFromAPI() {
        dataLoader.request(.getURLRequestWithPath(["banner"])) { [weak self] (result: APIResult) in
            
            guard let self = self else { return }
            
            switch result {
            case let .success(response):
                self.bannerData = response.data
                self.delegate?.didLoad()
                
            case let .failure(error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func numberOfSections() -> Int {
        return [bannerData].count
    }
    
    func numberOfItems() -> Int {
        guard let bannerCount = bannerData?.count else { return 0 }
        return bannerCount
    }
    
    func dtoForItems(indexPath: IndexPath) -> Any {
        let itemAtIndexPath = bannerData![indexPath.item]
        let imageURL = itemAtIndexPath.urlImage
        
        return BannerCellDTO(imageURL: imageURL)
    }
    
    func show(id: String) {
        
    }
    
    func transporter(_ indexPath: IndexPath) -> String {
        return ""
    }
}
