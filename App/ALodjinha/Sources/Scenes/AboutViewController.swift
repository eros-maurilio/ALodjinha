import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        
        setupNavBar()
    }
}

private extension AboutViewController {
    func setupNavBar() {
        navigationItem.title = "Sobre"
    }
}
