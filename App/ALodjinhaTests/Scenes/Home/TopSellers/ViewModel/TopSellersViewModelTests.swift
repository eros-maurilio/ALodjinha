import XCTest
@testable import ALodjinha

class TopSellersViewModelTests: XCTestCase {

    var mock: TopSellersViewModelMock!
    
    override func setUp() {
        mock = TopSellersViewModelMock()
    }
    
    func testLoadFromAPI(){
        mock.loadFromAPI()
        XCTAssertTrue(mock.isLoading)
    }
    
    func testInjectDataModel() {
        mock.injectDataModel(mock.topSellerData)
        XCTAssertTrue(mock.isInjecting)
    }
    
    func testNumberOfSections() {
        XCTAssertEqual(mock.numberOfSections(), 1)
    }
    
    func testNumberOfItems() {
        XCTAssertEqual(mock.numberOfItems(), 1)
    }
    
    func testDtoForItems() {
        let dto = mock.dtoForItems(indexPath: IndexPath(row: 0, section: 1))
        
        XCTAssertEqual(CategoryTableCellDTO(imageURL: dto.imageURL,
                                            name: dto.name,
                                            oldPrice: dto.oldPrice,
                                            newPrice: dto.newPrice),
                       CategoryTableCellDTO(imageURL: "https://images-submarino.b2w.io/produtos/01/00/item/128926/4/128926443_1GG.png",
                                            name: "Fifa 17",
                                            oldPrice: 299,
                                            newPrice: 119.99)
        )
    }
    
    func testShow() {
        mock.show(id: "7")
        XCTAssertTrue(mock.isShowing)
    }
    
    func testTransporter() {
        XCTAssertEqual(mock.transporter(IndexPath(row: 0, section: 1)), "7")
    }
}
