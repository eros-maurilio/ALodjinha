import UIKit

class ImageCacherView: UIImageView {
    
    // MARK: - Attributes
    
    let imageCache = NSCache<NSString, UIImage>()
    
    weak var delegate: cellDelegate?
    
    // MARK: - Downloader method
    
    func downloadImage(withURL urlString: String) {
        self.image = nil
        
        delegate?.startLoad()
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            self.image = cachedImage
            delegate?.stopLoad()
            return
        }
        
        guard let url = URL(string: urlString) else {
            self.delegate?.stopLoad()
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                debugPrint(error)
                self.delegate?.stopLoad()
                return
            }
            
            guard let data = data else {
                self.delegate?.stopLoad()
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                if let image = UIImage(data: data) {
                    self.image = image
                    self.imageCache.setObject(image, forKey: NSString(string: urlString))
                    self.delegate?.stopLoad()

                }
            }
        }
        .resume()
    }
}
