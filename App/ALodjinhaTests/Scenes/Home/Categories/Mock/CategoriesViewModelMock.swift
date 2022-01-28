import Foundation
@testable import ALodjinha

final class CategoriesViewModelMock: CategoriesViewModelProtocol {
    
    // MARK: - Model

    let categoriesData = [DataModel(id: 4,
                                    productName: nil,
                                    urlImage: "http://portal.ifrn.edu.br/campus/ceara-mirim/noticias/ifrn-oferece-curso-de-informatica-basica-para-pais-dos-estudantes/image_preview",
                                    productDescription: "Informática",
                                    oldPrice: nil,
                                    newPrice: nil,
                                    category: nil,
                                    linkUrl: nil)]
    
    // MARK: - Attributes

    private let viewModel = CategoriesViewModel(delegate: nil)
    var isInjecting = false
    var isShowing = false
    var isLoading = false
    
    // MARK: - Methods
    
    func injectDataModel(_ dataModel: [DataModel]) {
        viewModel.injectDataModel(categoriesData)
        isInjecting = true
    }
    
    func loadFromAPI() {
        viewModel.loadFromAPI()
        isLoading = true
    }
    
    func numberOfSections() -> Int {
        injectDataModel(categoriesData)
        return viewModel.numberOfSections()
    }
    
    func numberOfItems() -> Int {
        injectDataModel(categoriesData)
        return viewModel.numberOfItems()
    }
    
    func dtoForItems(indexPath: IndexPath) -> CategoryCollectionDTO {
        injectDataModel(categoriesData)
        return viewModel.dtoForItems(indexPath: indexPath)
    }
    
    func show(id: String) {
        viewModel.show(id: id)
        isShowing = true
    }
    
    func transporter(_ indexPath: IndexPath) -> String {
        injectDataModel(categoriesData)
        return viewModel.transporter(indexPath)
    }
}
