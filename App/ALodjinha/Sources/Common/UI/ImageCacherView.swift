import UIKit

class ImageCacherView: UIImageView {
    let imageCache = NSCache<NSString, UIImage>()
    
    func downloadImage(withURL urlString: String) {
        self.image = nil
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            self.image = cachedImage
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                debugPrint(error)
                return
            }
            
            guard let data = data else { return }
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                if let image = UIImage(data: data) {
                    self.image = image
                    self.imageCache.setObject(image, forKey: NSString(string: urlString))
                }
            }
        }
        .resume()
    }
}
