import UIKit

class ImageCacherView: UIImageView {
    
    // MARK: - Attributes
    
    let imageCache = NSCache<NSString, UIImage>()
    private var task: URLSessionDataTask?
    weak var delegate: ImageCacherDelegate?
    
    // MARK: - Downloader method
    
    func downloadImage(withURL urlString: String) {
        self.image = nil
        
        delegate?.startLoad()
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            self.image = cachedImage
            delegate?.stopLoad()
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        task = URLSession.shared.dataTask(with: url) { data, _, error in
            
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
                    self.delegate?.stopLoad()
                } else {
                    self.image = Styles.Image.placeholder
                    self.delegate?.stopLoad()
                    
                }
            }
        }
        task?.resume()
    }
    
    // MARK: - Task Canceller
    
    func taskCanceller() {
        delegate?.stopLoad()
        task?.cancel()
    }
}
