import XCTest
@testable import ALodjinha

class CategoryViewModelTests: XCTestCase {

    // MARK: - Properties
    private let delegateSpy = CategoryDelegateSpy()
    private let dataLoaderStub = DataLoaderStub()
    private lazy var sut = CategoryViewModel(dataLoader: dataLoaderStub, delegate: delegateSpy)
    private let mock: CategoryViewModelMock = CategoryViewModelMock()
    
    // MARK: - Test Methods
    
    func test_loadFromApi_whenDataloaderFails_itShouldLoadDelegateWithoutSuccess() {
        // Given
        dataLoaderStub.resultToUse = .failure(.fixture())
        
        // When
        sut.loadFromAPI(id: UUID().uuidString)
        
        // Then
        XCTAssertEqual(1, delegateSpy.didLoadCallCount)
        XCTAssert(delegateSpy.didLoadSuccess == false)
    }
    
    func test_loadFromApi_whenDataloaderSucceeds_andDataIsEmpty_itShouldLoadDelegateWithError() {
        // Given
        dataLoaderStub.resultToUse = .success(.init(data: []))
        
        // When
        sut.loadFromAPI(id: UUID().uuidString)
        
        // Then
        XCTAssertEqual(1, delegateSpy.didLoadCallCount)
        XCTAssert(delegateSpy.didLoadSuccess == false)
    }

    
    func test_loadFromApi_whenDataloaderSucceeds_andHasData_itShouldLoadDelegateWithSuccess() {
        // Given
        dataLoaderStub.resultToUse = .success(.init(data: [.fixture()]))
        
        // When
        sut.loadFromAPI(id: UUID().uuidString)
        
        // Then
        XCTAssertEqual(1, delegateSpy.didLoadCallCount)
        XCTAssert(delegateSpy.didLoadSuccess == true)
    }

    
    func test_numberOfSections() {
        // Given
        let expecetedSectionCount = 1
        
        // When
        let actualSectionCount = sut.numberOfSections()
        
        // Then
        XCTAssertEqual(actualSectionCount, expecetedSectionCount)
    }
    
    func testNumberOfItems() {
        // Given
        let expectedItemCount = Int.random(in: 1...100)
        dataLoaderStub.resultToUse = .success(.init(data: .init(repeating: .fixture(), count: expectedItemCount)))
        sut.loadFromAPI(id: "1")
       
        // When
        let actualItemCount = sut.numberOfItems()
        
        // Then
        XCTAssertEqual(actualItemCount, expectedItemCount)
        
    }
    
    func testDtoForItems() throws {
        // Given
        
        let expectedItemId = UUID().uuidString
        var itemsStub: [DataModel] = .init(repeating: .fixture(), count: .random(in: 1...100))
        let expectedItemIndex = try XCTUnwrap(itemsStub.indices.randomElement())
        
        itemsStub[expectedItemIndex] = .fixture(urlImage: expectedItemId)
        
        dataLoaderStub.resultToUse = .success(.init(data: itemsStub))
        sut.loadFromAPI(id: "1")

        // When
        
        let actualItem = sut.dtoForItems(indexPath: .init(row: expectedItemIndex, section: 0))
        
        // Then
        XCTAssertEqual(actualItem.imageURL, expectedItemId)
    }
    
    func testShowCategory()  throws {
        throw XCTSkip()
        mock.showCategory(id: "7")
        XCTAssertTrue(mock.isShowing)
    }
    
    func testTransporter()  throws {
        throw XCTSkip()
        XCTAssertEqual(mock.transporter(IndexPath(row: 0, section: 1)), "7")
    }
    
    func testNavTitle()  throws {
        throw XCTSkip()
        XCTAssertEqual(mock.navTitle, "Games")
    }
}

extension DataModel {
    static func fixture(
        id: Int = 0,
        productName: String? = nil,
        urlImage: String = "",
        productDescription: String? = nil,
        oldPrice: Float? = nil,
        newPrice: Float? = nil,
        category: CategoryModel? = nil,
        linkUrl: String? = nil
    )
    -> Self {
        .init(id: id, productName: productName, urlImage: urlImage, productDescription: productDescription, oldPrice: oldPrice, newPrice: newPrice, category: category, linkUrl: linkUrl)
    }
}

final class DataLoaderStub: DataLoaderProtocol {
    var resultToUse: APIResult = .failure(.init())
    func make<T>(_ endPoint: EndPoint, completion: @escaping (Result<T, NSError>) -> Void) where T : Decodable {
        completion(resultToUse.map { $0 as! T })
    }
}

final class CategoryDelegateSpy: CategoryDelegate {
    var didLoadCallCount = 0
    var didLoadSuccess: Bool?
    func didLoad(success: Bool) {
        didLoadCallCount += 1
        didLoadSuccess = success
    }
    
    func showMore(id: String) {
        fatalError("NYI")
    }
}

extension NSError {
    static func fixture(domain: String = "dummy") -> NSError {
        .init(domain: domain, code: 1, userInfo: nil)
    }
}
