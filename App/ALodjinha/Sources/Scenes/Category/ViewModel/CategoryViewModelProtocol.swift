import Foundation

protocol CategoryViewModelProtocol: AnyObject {
    var navTitle: String { get }
    func injectDataModel(_ dataModel: [DataModel])
    func loadFromAPI(id: String)
    func numberOfSections() -> Int
    func numberOfItems() -> Int
    func dtoForItems(indexPath: IndexPath) -> CategoryTableCellDTO
    func showCategory(id: String)
    func transporter(_ indexPath: IndexPath) -> String
}

protocol CategoryDelegate: AnyObject {
    func didLoad(success: Bool)
    func showMore(id: String)
}
