import Foundation

protocol BannerViewModelProtocol {
    func loadFromAPI()
    func numberOfSections() -> Int
    func numberOfItems() -> Int
    func dtoForItems(indexPath: IndexPath) -> BannerCollectionCellDTO
    func show(id: String)
    func transporter(_ indexPath: IndexPath) -> String
}
