import XCTest
@testable import ALodjinha

class CategoryViewModelTests: XCTestCase {

    var mock: CategoryViewModelMock!
    
    override func setUp() {
        mock = CategoryViewModelMock()
    }
    
    func testInjectDataModel() {
        mock.injectDataModel(mock.categoryData)
        XCTAssertTrue(mock.isInjecting)
    }
    
    func testLoadFromAPI() {
        mock.loadFromAPI(id: "7")
        XCTAssertTrue(mock.isLoading)
    }
    
    func testNumberOfSection() {
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
                                            newPrice: 119.99))
        
    }
    
    func testShowCategory() {
        mock.showCategory(id: "7")
        XCTAssertTrue(mock.isShowing)
    }
    
    func testTransporter() {
        XCTAssertEqual(mock.transporter(IndexPath(row: 0, section: 1)), "7")
    }
    
    func testNavTitle() {
        XCTAssertEqual(mock.navTitle, "Games")
    }
}
