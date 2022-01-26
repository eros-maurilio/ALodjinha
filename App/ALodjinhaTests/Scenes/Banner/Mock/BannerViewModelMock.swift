//
//  BannerViewModelMock.swift
//  ALodjinhaTests
//
//  Created by Luis Ferreira on 26/01/22.
//

import Foundation
@testable import ALodjinha

class BannerViewModelMock: BannerViewModelProtocol {
    
    private let dataModel: [DataModel] = [
        DataModel(id: 0,
                  productName: "Eros",
                  urlImage: "Qualquer Image",
                  productDescription: "Qualquer Descrição",
                  oldPrice: 1.0,
                  newPrice: 1.5,
                  category: CategoryModel(id: 0,
                                          categoryName: "category name",
                                          imageURL: "qualquer url"),
                  linkUrl: "qualquer link"),
        DataModel(id: 1,
                  productName: "Luis",
                  urlImage: "Qualquer Image 1",
                  productDescription: "Qualquer Descrição 1",
                  oldPrice: 1.5,
                  newPrice: 2.5,
                  category: CategoryModel(id: 1,
                                          categoryName: "category name 1",
                                          imageURL: "qualquer url 1"),
                  linkUrl: "qualquer link 1")
    ]
    
    private let viewModel = BannerViewModel(delegate: nil)
    var loadFromAPIIsCalled = false
    var showIsCalled = false
    
    func setBanner(_ dataModel: [DataModel]) {
        viewModel.setBanner(dataModel)
    }
    
    func loadFromAPI() {
        viewModel.loadFromAPI()
        loadFromAPIIsCalled = true
    }
    
    func numberOfSections() -> Int {
        setBanner(dataModel)
        return viewModel.numberOfSections()
    }
    
    func numberOfItems() -> Int {
        setBanner(dataModel)
        return viewModel.numberOfItems()
    }
    
    func dtoForItems(indexPath: IndexPath) -> BannerCollectionCellDTO {
        setBanner(dataModel)
        return viewModel.dtoForItems(indexPath: indexPath)
    }
    
    func show() {
        viewModel.show()
        showIsCalled = true
    }
}
