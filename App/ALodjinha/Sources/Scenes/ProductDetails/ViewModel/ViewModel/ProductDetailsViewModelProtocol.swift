protocol ProductDetailsViewModelProtocol: AnyObject {
    var navTitle: String { get }
    func loadFromAPI(productID id: String)
    func dtoForViews() -> ProductDetailsDTO
    func booking()
}
