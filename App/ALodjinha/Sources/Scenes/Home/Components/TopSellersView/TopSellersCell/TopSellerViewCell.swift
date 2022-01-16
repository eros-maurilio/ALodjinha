import UIKit

struct TopSellersDTO {
    let image: UIImage
    let name: String
    let oldPrice: String
    let newPrice: String
}

class TopSellerViewCell: UITableViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var oldPrice: UILabel!
    @IBOutlet weak var newPrice: UILabel!
    
    func fill(dto: TopSellersDTO) {
        productImage.image = dto.image
        name.text = dto.name
        oldPrice.text = dto.oldPrice
        newPrice.text = dto.newPrice
    }
}
