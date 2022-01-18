import UIKit

@IBDesignable class TopSellersViewWrapper: NibWrapperView<TopSellersView> { }

class TopSellersView: UIView {

    // MARK: - IBOutlet

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var tableViewHeight: NSLayoutConstraint!
    
}

    // MARK: - Public Method

extension TopSellersView {
    
    func setup() {
        registerCell()
        rowSetup()
    }
    
    func updateTableViewHeight() -> CGFloat {
        tableView.layoutIfNeeded()
        tableViewHeight.constant = tableView.contentSize.height
        
        return tableViewHeight.constant
    }
}

    // MARK: - Private Methods

private extension TopSellersView {
    func registerCell() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TopSellerViewCell.self)
        tableView.tableFooterView = UIView()
    }
    
    func cell(_ tableView: UITableView, at indexPath: IndexPath, forACellDTO ACellDTO: TopSellersDTO) -> TopSellerViewCell {
        let cell = tableView.dequeueCell(TopSellerViewCell.self, indexPath)
        cell.fill(dto: ACellDTO)
        
        return cell
    }
    
    func rowSetup() {
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
    }
}

    // MARK: - UITableViewDataSource

extension TopSellersView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell(tableView, at: indexPath, forACellDTO: TopSellersDTO(image: UIImage(named: "Placeholder")!,
                                                                  name: "Nome do produto com uma descrição bem grandona",
                                                                  oldPrice: "De: 12345,55",
                                                                  newPrice: "Por 5555,55"))
    }
}

    // MARK: - UITableViewDelegate

extension TopSellersView: UITableViewDelegate { }
