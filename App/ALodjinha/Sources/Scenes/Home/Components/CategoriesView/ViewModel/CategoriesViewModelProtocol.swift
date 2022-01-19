import Foundation

protocol CategoriesViewModelProtocol {
    func loadFromAPI()
    func numberOfSections() -> Int
    func numberOfItems() -> Int
    func dtoForItems(indexPath: IndexPath) -> CategoryCollectionDTO
    func show(id: String)
    func transporter(_ indexPath: IndexPath) -> String
}
