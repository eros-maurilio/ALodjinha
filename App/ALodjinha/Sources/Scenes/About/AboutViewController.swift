import UIKit

class AboutViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
    }
}

private extension AboutViewController {
    func setupNavBar() {
        navigationItem.title = "Sobre"
    }
}
