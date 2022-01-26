import UIKit

final class BannerViewModel: BannerViewModelProtocol {
    
    // MARK: - Private Attributes
    
    private var bannerData = [DataModel]()
    private var dataLoader = DataLoader()
    private weak var delegate: BannerDetailDelegate?
    
    // MARK: - Dependencies
    
    init(delegate: BannerDetailDelegate?) {
        self.delegate = delegate
    }
    
    // MARK: - Public Methods
    
    func loadFromAPI() {
        dataLoader.make(.urlRequestWithPath([Strings.URL.bannerPath])) { [weak self] (result: APIResult) in
            
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
    
    func setBanner(_ dataModel: [DataModel]) {
        self.bannerData = dataModel
    }
    
    func numberOfSections() -> Int {
        return [bannerData].count
    }
    
    func numberOfItems() -> Int {
        return bannerData.count
    }
    
    func dtoForItems(indexPath: IndexPath) -> BannerCollectionCellDTO {
        let itemAtIndexPath = bannerData[indexPath.item]
        let imageURL = itemAtIndexPath.urlImage
        
        return BannerCollectionCellDTO(imageURL: imageURL)
    }
    
    func show() {
        delegate?.showMore()
    }
}
