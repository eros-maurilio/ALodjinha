import XCTest
@testable import ALodjinha

class CategoriesViewModelTests: XCTestCase {
    
    // MARK: - Properties

    var mock: CategoriesViewModelMock!
    
    // MARK: - Test Setup
    
    override func setUp() {
        mock = CategoriesViewModelMock()
    }
    
    // MARK: - Test Methods

    func testLoadFromAPI() {
        mock.loadFromAPI()
        XCTAssertTrue(mock.isLoading)
    }
    
    func testNumberOfSections() {
        XCTAssertEqual(mock.numberOfSections(), 1)
    }
    
    func testnumberOfItems() {
        XCTAssertEqual(mock.numberOfItems(), 1)
    }
    
    func testDtoFotItems() {
        let dto = mock.dtoForItems(indexPath: IndexPath(row: 0, section: 1))
        
        XCTAssertEqual(CategoryCollectionDTO(imageURL: dto.imageURL,
                                             name: dto.name),
                       CategoryCollectionDTO(imageURL: "http://portal.ifrn.edu.br/campus/ceara-mirim/noticias/ifrn-oferece-curso-de-informatica-basica-para-pais-dos-estudantes/image_preview",
                                             name: "Informática"))
    }
    
    func testShow() {
        mock.show(id: "")
        XCTAssertTrue(mock.isShowing)
    }
    
    func testTranporter() {
        XCTAssertEqual(mock.transporter(IndexPath(row: 0, section: 0)), "4")
    }
}
