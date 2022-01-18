import Foundation

protocol TableCollectionViewModelProtocol: ViewModelProtocol {
    func numberOfSections() -> Int
    func numberOfItems() -> Int
    func dtoForItems(indexPath: IndexPath) -> Any
    func transporter(_ indexPath: IndexPath) -> String
}
