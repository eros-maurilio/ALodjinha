import UIKit

protocol HomeViewDelegate: AnyObject {
    func didPush(view: UIViewController)
    func didLoad()
}
