import UIKit

class AboutViewController: UIViewController {

    // MARK: - View's Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
}

    // MARK: - Private Methods

private extension AboutViewController {
    
    func setupNavBar() {
        navigationItem.title = "Sobre"
    }
}
