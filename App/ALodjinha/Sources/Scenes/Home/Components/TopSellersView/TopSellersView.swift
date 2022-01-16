import UIKit

@IBDesignable class TopSellersViewWrapper: NibWrapperView<TopSellersView> { }

class TopSellersView: UIView {

    // MARK: - IBOutlet

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Public Method
    
    func setup() {
        registerCell()
        rowSetup()
    }
}

    // MARK: - Private Methods

private extension TopSellersView {
    func registerCell() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TopSellerViewCell.self)
    }
    
    func cell(_ tableView: UITableView, at indexPath: IndexPath, forACellDTO ACellDTO: TopSellersDTO) -> TopSellerViewCell {
        let cell = tableView.dequeueCell(TopSellerViewCell.self, indexPath)
        cell.fill(dto: ACellDTO)
        
        return cell
    }
    
    func rowSetup() {
        tableView.estimatedRowHeight = 80
    }
}

    // MARK: - UITableViewDataSource

extension TopSellersView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell(tableView, at: indexPath, forACellDTO: TopSellersDTO(image: UIImage(named: "axlPlaceHolder")!,
                                                                  name: "Nome do produto com uma descrição bem grandona",
                                                                  oldPrice: "De: 12345,55",
                                                                  newPrice: "Por 5555,55"))
    }
}

    // MARK: - UITableViewDelegate

extension TopSellersView: UITableViewDelegate { }
