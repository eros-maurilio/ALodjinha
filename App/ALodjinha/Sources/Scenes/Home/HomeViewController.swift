import UIKit

class HomeViewController: UIViewController {
    @IBOutlet private weak var bannerCollection: UICollectionView!
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        
        setupNavBar()
        registerCell(for: bannerCollection)
        configureView()

    }
}

private extension HomeViewController {
    func setupNavBar() {
        let logo = UIImage(named: "NavBar")
        let frame = CGRect(x: 0, y: 0, width: 125, height: 33)
        let imageView = UIImageView(image: logo)
        imageView.frame = frame
        
        navigationItem.titleView = imageView
    }
    
    func registerCell(for: UICollectionView) {
        bannerCollection.dataSource = self
        bannerCollection.register(BannerViewCell.self)
    }
    
    func collectionCell(_ collectionView: UICollectionView, at indexPath: IndexPath, forACellDTO aCellDTO: BannerCellDTO) -> BannerViewCell {
        let cell = collectionView.dequeueCell(BannerViewCell.self, indexPath)
        cell.fillCell(dto: aCellDTO)
        
        return cell
    }
    
    func configureView() {
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionCell(collectionView, at: indexPath, forACellDTO: BannerCellDTO(image: UIImage(named: "axlPlaceHolder")!))
    }
}
