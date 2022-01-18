import UIKit

@IBDesignable class TopSellersViewWrapper: NibWrapperView<TopSellersView> { }

class TopSellersView: UIView {

    // MARK: - IBOutlet

    @IBOutlet private weak var tableView: UITableView!
    
    private lazy var viewModel: TableCollectionViewModelProtocol = TopSellersViewModel(delegate: self)
    
}

    // MARK: - Public Method

extension TopSellersView {
    
    func setup() {
        registerCell()
        viewModel.loadFromAPI()
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
        viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell(tableView, at: indexPath, forACellDTO: viewModel.dtoForItems(indexPath: indexPath) as! TopSellersDTO)
    }
}

    // MARK: - UITableViewDelegate

extension TopSellersView: UITableViewDelegate { }

extension TopSellersView: LoadContentable {
    func didLoad() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            self.tableView.reloadData()
            self.rowSetup()
        }
        
    }
    
    func showMore() {
        
    }
}
