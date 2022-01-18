import Foundation

struct EndPoint {
    let path: String
    
    var url: URL? {
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "alodjinha.herokuapp.com"
        components.path = path
        
        return components.url
    }
}

extension EndPoint {
    static func getRequestURL(_ paths: [String]) -> EndPoint {
        var currentPath = String()
        
        for path in paths {
            currentPath += path.insertSlash(in: path)
        }
        
        return EndPoint(path: currentPath)
    }
}
