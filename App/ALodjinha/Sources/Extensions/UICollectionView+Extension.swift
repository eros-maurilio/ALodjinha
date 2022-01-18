import UIKit

extension UICollectionView {
    
    func dequeueCell<T: UICollectionViewCell>(_ : T.Type, _ indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as? T else {
            return T()
        }
        
        return cell
    }
    
    func register<T: UICollectionViewCell>(_ : T.Type) {
        let identifier = String(describing: T.self)
        register(T.self, forCellWithReuseIdentifier: identifier)
        register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
}
