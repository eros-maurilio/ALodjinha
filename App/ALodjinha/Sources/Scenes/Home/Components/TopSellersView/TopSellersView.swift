import UIKit

@IBDesignable class TopSellersViewWrapper: NibWrapperView<TopSellersView> { }

class TopSellersView: UIView {

    // MARK: - IBOutlet

    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private lazy var viewModel: TopSellersViewModelProtocol = TopSellersViewModel(delegate: self)
    weak var delegate: ViewDelegate?
    
}

    // MARK: - Public Method

extension TopSellersView {
    
    func setup() {
        viewModel.loadFromAPI()
    }
}

    // MARK: - Private Methods

private extension TopSellersView {
    
    func registerCell() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProductCell.self)
        tableView.tableFooterView = UIView()
    }
    
    func cell(_ tableView: UITableView, at indexPath: IndexPath, forACellDTO ACellDTO: CategoryTableCellDTO) -> ProductCell {
        let cell = tableView.dequeueCell(ProductCell.self, indexPath)
        cell.fill(dto: ACellDTO)
        
        return cell
    }
    
    func rowSetup() {
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func sendView(_ view: UIViewController) {
        delegate?.didPush(view: view)
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
        cell(tableView, at: indexPath, forACellDTO: viewModel.dtoForItems(indexPath: indexPath))
    }
}

    // MARK: - UITableViewDelegate

extension TopSellersView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.show(id: viewModel.transporter(indexPath))
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

    // MARK: - ViewDelegate

extension TopSellersView: LoadContentable {
    
    func didLoad() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.registerCell()
            self.tableView.reloadData()
            self.rowSetup()
        }
    }
    
    func showMore(id: String) {
        let viewControler = ProductDetailsView()
        viewControler.setupView(id: id)
        sendView(viewControler)
    }
}
