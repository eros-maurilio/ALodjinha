import UIKit

class CategoryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    private lazy var viewModel: CategoryViewModelProtocol = CategoryViewModel(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setup(categoryID: String) {
        viewModel.loadFromAPI(id: categoryID)
    }
}

private extension CategoryViewController {
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProductCell.self)
    }
    
    func cell(_ tableView: UITableView, at indexPath: IndexPath, forCellDTO aCellDTO: TopSellersDTO) -> ProductCell {
        let cell = tableView.dequeueCell(ProductCell.self, indexPath)
        cell.fill(dto: aCellDTO)
        
        return cell
    }
    
    func rowSetup() {
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func setupNavBar() {
        navigationItem.title = viewModel.navTitle
    }
}

extension CategoryViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberOfItems()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell(tableView, at: indexPath, forCellDTO: viewModel.dtoForItems(indexPath: indexPath) as! TopSellersDTO)
    }
    
}

extension CategoryViewController: UITableViewDelegate {

    
}

extension CategoryViewController: LoadContentable {
    func didLoad() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.setupNavBar()
            self.setupTableView()
            print(self.tableView.contentSize)
            self.tableView.reloadData()
            self.rowSetup()
             
        }
    }
    
    func showMore(id: String) {
        
    }
}

