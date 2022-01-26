//
//  ALodjinhaTests.swift
//  ALodjinhaTests
//
//  Created by Luis Ferreira on 26/01/22.
//

import XCTest
@testable import ALodjinha

class ALodjinhaTests: XCTestCase {

    var mock: BannerViewModelMock!
    
    override func setUp() {
        mock = BannerViewModelMock()
    }

    func testNumberOfSections() {
        XCTAssertEqual(mock.numberOfSections(), 1)
    }
    
    func testNumberOfItems() {
        XCTAssertEqual(mock.numberOfItems(), 2)
    }
    
    func testDtoForItems() {
        let dto = mock.dtoForItems(indexPath: IndexPath(row: 0, section: 1))
        XCTAssertEqual(dto.imageURL, "Qualquer Image")
    }
    
    func testShowIsCalled() {
        mock.show()
        XCTAssertEqual(mock.showIsCalled, true)
    }
    
    func testLoadFromAPI() {
        mock.loadFromAPI()
        XCTAssertEqual(mock.loadFromAPIIsCalled, true)
    }
}
