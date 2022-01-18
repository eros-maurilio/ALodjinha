import UIKit

typealias BannerResult = Result<BannerResponse, NSError>

final class BannerViewModel: BannerViewModelProtocol {
    
    private var bannerData: [DataModel]?
    private weak var delegate: LoadContentable?
    private var dataLoader = DataLoader()
    
    init(delegate: LoadContentable) {
        self.delegate = delegate
    }
    
    func loadBanner() {
        dataLoader.request(.getRequestURL(["banner"])) { [weak self] (result: BannerResult) in
            
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
    
    func dtoForItems(indexPath: IndexPath) -> BannerCellDTO {
        let itemAtIndexPath = bannerData![indexPath.item]
        let imageURL = itemAtIndexPath.urlImagem
        let id = itemAtIndexPath.id
        
        return BannerCellDTO(imageURL: imageURL)
    }
    
    func transporter(_ indexPath: IndexPath) -> String {
        return ""
    }
}