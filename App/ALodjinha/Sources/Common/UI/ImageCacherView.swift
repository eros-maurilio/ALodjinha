import UIKit
import OSLog

protocol ImageCaching {
    func  get(from url: URL, setImage: @escaping(UIImage?) -> Void)
}

final class ImageCache: ImageCaching {
    private let imageCache = NSCache<NSString, UIImage>()
    private var taskPool: NSCache<NSString, URLSessionDataTask> = .init()
    
    static let shared = ImageCache()
    private init() {}
    
    func get(from url: URL, setImage: @escaping(UIImage?) -> Void) {
        let cachingKey = url.absoluteString as NSString
        setImage(nil)
        
        if let cachedImage = imageCache.object(forKey: cachingKey) {
            setImage(cachedImage)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                debugPrint(error)
                return
            }
            
            guard let data = data
            else { return }
            
            
            DispatchQueue.main.async {
                setImage(Styles.Image.placeholder)
                if let image = UIImage(data: data) {
                    self.imageCache.setObject(image, forKey: cachingKey)
                    setImage(image)
                }
                self.taskPool.removeObject(forKey: cachingKey)
            }
        }
        taskPool.setObject(task, forKey: cachingKey)
        task.resume()
    }
}

extension UIImageView {
    func from(url: URL, using cacheService: ImageCaching = ImageCache.shared) {
        cacheService.get(from: url) { [weak self] in
            self?.image = $0
        }
    }
}

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
