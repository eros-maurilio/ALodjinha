import Foundation
@testable import ALodjinha

class BannerViewModelMock: BannerViewModelProtocol {
    
    // MARK: - Model

    private let bannerData: [DataModel] = [DataModel(id: 1,
                                       productName: nil,
                                       urlImage: "https://images-submarino.b2w.io/spacey/2017/02/06/MainTop_GAMES_FEV17.png",
                                       productDescription: nil,
                                       oldPrice: nil,
                                       newPrice: nil,
                                       category: nil,
                                       linkUrl: nil)]
        
    // MARK: - Attributes

    private let viewModel = BannerViewModel(delegate: nil)
    var isLoading = false
    var isShowing = false
    
    // MARK: - Methods
    
    func loadFromAPI() {
        viewModel.loadFromAPI()
        isLoading = true
    }
    
    func numberOfSections() -> Int {
        injectDataModel(bannerData)
        return viewModel.numberOfSections()
    }
    
    func numberOfItems() -> Int {
        injectDataModel(bannerData)
        return viewModel.numberOfItems()
    }
    
    func dtoForItems(indexPath: IndexPath) -> BannerCollectionCellDTO {
        injectDataModel(bannerData)
        return viewModel.dtoForItems(indexPath: indexPath)
    }
    
    func show() {
        viewModel.show()
        isShowing = true
    }
    
    func injectDataModel(_ dataModel: [DataModel]) {
        viewModel.injectDataModel(bannerData)
    }
}
