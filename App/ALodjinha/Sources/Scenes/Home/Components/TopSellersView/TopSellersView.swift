import UIKit

@IBDesignable class TopSellersViewWrapper: NibWrapperView<TopSellersView> { }

class TopSellersView: UIView {
    @IBOutlet private weak var tableView: UITableView!
    
}
