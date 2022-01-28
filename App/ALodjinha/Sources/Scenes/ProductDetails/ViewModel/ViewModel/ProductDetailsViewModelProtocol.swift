protocol ProductDetailsViewModelProtocol: AnyObject {
    var navTitle: String { get }
    func loadFromAPI(productID id: String)
    func dtoForViews() -> ProductDetailsDTO
    func booking()
    func injectDataModel(_ dataModel: DataModel)
}

protocol DetailsDelegate: SearchViewDelegate {
    func didLoad()
    func alertHandler(message: String)
}
