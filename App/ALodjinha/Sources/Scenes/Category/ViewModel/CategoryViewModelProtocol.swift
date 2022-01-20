import Foundation

protocol CategoryViewModelProtocol: AnyObject {
    var navTitle: String { get }
    func loadFromAPI(id: String)
    func numberOfSections() -> Int
    func numberOfItems() -> Int
    func dtoForItems(indexPath: IndexPath) -> CategoryTableCellDTO
    func showCategory(id: String)
    func transporter(_ indexPath: IndexPath) -> String
}