import UIKit

class CategoryViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    
    private lazy var viewModel: CategoryViewModelProtocol = CategoryViewModel(dataLoader: DataLoader(), delegate: self)
    
    // MARK: - View's Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

    // MARK: - Public Methods

extension CategoryViewController {
    
    func setup(categoryID: String) {
        viewModel.loadFromAPI(id: categoryID)
    }
}

    // MARK: - Private Methods

private extension CategoryViewController {
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProductCell.self)
    }
    
    func cell(_ tableView: UITableView, at indexPath: IndexPath, forCellDTO aCellDTO: CategoryTableCellDTO) -> ProductCell {
        let cell = tableView.dequeueCell(ProductCell.self, indexPath)
        cell.fill(dto: aCellDTO)
        
        return cell
    }
    
    func rowSetup() {
        tableView.estimatedRowHeight = Metrics.TopSellers.rowSize
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func setupNavBar() {
        navigationItem.title = viewModel.navTitle
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
        tableView.isHidden = false
    }
    
    func setupAlert() {
        let alert = UIAlertController(title: Strings.Alert.title, message: Strings.Alert.error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Strings.Alert.action, style: .default, handler: popView))
        present(alert, animated: true)
    }
    
    func popView(action: UIAlertAction? = nil) {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

    // MARK: - UITableViewDataSouce

extension CategoryViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell(tableView, at: indexPath, forCellDTO: viewModel.dtoForItems(indexPath: indexPath))
    }
}

    // MARK: - UITableViewDelegate

extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.showCategory(id: viewModel.transporter(indexPath))
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

    // MARK: - ViewDelegate

extension CategoryViewController: CategoryDelegate {
    
    func didLoad(success: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            if success {
                self.setupNavBar()
                self.setupTableView()
                self.tableView.reloadData()
                self.rowSetup()
                self.stopLoading()
            } else {
                self.tableView.isHidden = true
                self.setupAlert()
                self.stopLoading()
            }
        }
    }
    
    func showMore(id: String) {
        let viewController = ProductDetailsViewController()
        viewController.setupView(productID: id)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

