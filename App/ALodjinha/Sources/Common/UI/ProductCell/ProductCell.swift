import UIKit

struct TopSellersDTO {
    let imageURL: String
    let name: String
    let oldPrice: Float
    let newPrice: Float
}

class ProductCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var productImage: ImageCacherView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var oldPrice: UILabel!
    @IBOutlet weak var newPrice: UILabel!
    
    // MARK: - Public Method
    
    func fill(dto: TopSellersDTO) {
        productImage.downloadImage(withURL: dto.imageURL)
        
        if productImage.image == nil {
            productImage.image = UIImage(named: "Placeholder")
        }
        name.text = dto.name
        oldPrice.text = "De: \(String(dto.oldPrice))"
        newPrice.text = "Por \(String(dto.newPrice))"
    }
}
