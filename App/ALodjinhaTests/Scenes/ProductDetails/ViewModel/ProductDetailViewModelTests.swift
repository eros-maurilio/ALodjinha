import XCTest
@testable import ALodjinha

class ProductDetailViewModelTests: XCTestCase {

    // MARK: - Properties

    var mock: ProductDetailViewModelMock!
    
    // MARK: - Test Setup

    override func setUp() {
        mock = ProductDetailViewModelMock()
    }
    
    // MARK: - Test Methods

    func testInjectData() {
        mock.injectDataModel(mock.productData)
        XCTAssertTrue(mock.isInjecting)
    }
    
    func testLoadFromApi() {
        mock.loadFromAPI(productID: "7")
        XCTAssertTrue(mock.isLoading)
    }

    func testDtoForViews() {
        let dto = mock.dtoForViews()
        
        XCTAssertEqual(ProductDetailsDTO(name: dto.name,
                                         imageURL: dto.imageURL,
                                         oldPrice: dto.oldPrice,
                                         newPrice: dto.newPrice,
                                         description: dto.description),
                       ProductDetailsDTO(name: "Fifa 17",
                                         imageURL: "https://images-submarino.b2w.io/produtos/01/00/item/128926/4/128926443_1GG.png",
                                         oldPrice: 299,
                                         newPrice: 119.99,
                                         description: "Mussum Ipsum, cacilds vidis litro abertis. Atirei o pau no gatis, per gatis num morreus. Não sou faixa preta cumpadi, sou preto inteiris, inteiris. Praesent malesuada urna nisi, quis volutpat erat hendrerit non. Nam vulputate dapibus. Diuretics paradis num copo é motivis de denguis.<br/><br/>Copo furadis é disculpa de bebadis, arcu quam euismod magna. Casamentiss faiz malandris se pirulitá. Vehicula non. Ut sed ex eros. Vivamus sit amet nibh non tellus tristique interdum. in elementis mé pra quem é amistosis quis leo.<br/><br/>A ordem dos tratores não altera o pão duris Delegadis gente finis, bibendum egestas augue arcu ut est. Mé faiz elementum girarzis, nisi eros vermeio. Si u mundo tá muito paradis? Toma um mé que o mundo vai girarzis!"))
    }
}
