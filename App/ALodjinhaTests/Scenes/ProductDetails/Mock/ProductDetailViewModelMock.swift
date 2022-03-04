import UIKit
@testable import ALodjinha

final class ProductDetailViewModelMock: ProductDetailsViewModelProtocol {

    // MARK: - Model

    let productData = DataModel(id: 7,
                                                         productName: "Fifa 17",
                                                         urlImage: "https://images-submarino.b2w.io/produtos/01/00/item/128926/4/128926443_1GG.png",
                                                         productDescription: "Mussum Ipsum, cacilds vidis litro abertis. Atirei o pau no gatis, per gatis num morreus. Não sou faixa preta cumpadi, sou preto inteiris, inteiris. Praesent malesuada urna nisi, quis volutpat erat hendrerit non. Nam vulputate dapibus. Diuretics paradis num copo é motivis de denguis.<br/><br/>Copo furadis é disculpa de bebadis, arcu quam euismod magna. Casamentiss faiz malandris se pirulitá. Vehicula non. Ut sed ex eros. Vivamus sit amet nibh non tellus tristique interdum. in elementis mé pra quem é amistosis quis leo.<br/><br/>A ordem dos tratores não altera o pão duris Delegadis gente finis, bibendum egestas augue arcu ut est. Mé faiz elementum girarzis, nisi eros vermeio. Si u mundo tá muito paradis? Toma um mé que o mundo vai girarzis!",
                                                         oldPrice: 299,
                                                         newPrice: 119.99,
                                                         category: CategoryModel(id: 1,
                                                                                 categoryName: "Games",
                                                                                 imageURL: "http://39ahd9aq5l9101brf3b8dq58.wpengine.netdna-cdn.com/wp-content/uploads/2013/06/3D-Gaming.png"),
                                                         linkUrl: nil)
    
    // MARK: - Attributes
    
    var isBooking = false
    var isLoading = false
    var isInjecting = false
    let viewModel: ProductDetailsViewModelProtocol = ProductDetailsViewModel(delegate: nil)
    var navTitle: String { "" }
  
    // MARK: - Methods

    func injectDataModel(_ dataModel: DataModel) {
        isInjecting = true
        viewModel.injectDataModel(dataModel)
    }
    
    func loadFromAPI(productID id: String) {
        isLoading = true
        viewModel.loadFromAPI(productID: id)
    }
    
    func dtoForViews() -> ProductDetailsDTO {
        injectDataModel(productData)
        return viewModel.dtoForViews()
    }
    
    func booking() {
        isBooking = true
        viewModel.booking()
    }
}
