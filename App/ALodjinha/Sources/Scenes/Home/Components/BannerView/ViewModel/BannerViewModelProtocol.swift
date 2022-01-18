import Foundation

protocol BannerViewModelProtocol: AnyObject {
    func loadBanner()
    func numberOfSections() -> Int
    func numberOfItems() -> Int
    func dtoForItems(indexPath: IndexPath) -> BannerCellDTO
    func transporter(_ indexPath: IndexPath) -> String
    
}

protocol LoadContentable: AnyObject {
    func didLoad()
    func showMore()
}
