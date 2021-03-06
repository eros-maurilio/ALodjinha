import Foundation

protocol TopSellersViewModelProtocol {
    func injectDataModel(_ dataModel: [DataModel])
    func loadFromAPI()
    func numberOfSections() -> Int
    func numberOfItems() -> Int
    func dtoForItems(indexPath: IndexPath) -> CategoryTableCellDTO
    func show(id: String)
    func transporter(_ indexPath: IndexPath) -> String
}
