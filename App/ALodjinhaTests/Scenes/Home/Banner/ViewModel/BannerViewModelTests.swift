import XCTest
@testable import ALodjinha

class BannerViewModelTests: XCTestCase {

    // MARK: - Properties

    var mock: BannerViewModelMock!
    
    // MARK: - Test Setup

    override func setUp() {
        mock = BannerViewModelMock()
    }
    
    // MARK: - Test Methods
    
    func testLoadData() {
        mock.loadFromAPI()
        XCTAssertTrue(mock.isLoading)
    }
    
    func testNumberOfSections() {
        XCTAssertEqual(mock.numberOfSections(), 1)
    }
    
    func testNumberOfItems() {
        XCTAssertEqual(mock.numberOfItems(), 1)
    }
    
    func testDtoForItems() {
        let dto = mock.dtoForItems(indexPath: IndexPath(row: 0, section: 1))
        XCTAssertEqual(dto.imageURL, "https://images-submarino.b2w.io/spacey/2017/02/06/MainTop_GAMES_FEV17.png")
    }
    
    func testShow() {
        mock.show()
        XCTAssertTrue(mock.isShowing)
    }
}
