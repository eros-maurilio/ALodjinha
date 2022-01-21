import Foundation

protocol BannerViewModelProtocol {
    func loadFromAPI()
    func numberOfSections() -> Int
    func numberOfItems() -> Int
    func dtoForItems(indexPath: IndexPath) -> BannerCollectionCellDTO
    func show()
}

protocol BannerDetailDelegate: SearchViewDelegate {
    func showMore()
}
