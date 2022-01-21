import Foundation

struct EndPoint {
    
    // MARK: - Attributes
    
    let path: String
    let queryItem: [URLQueryItem]?
    
    // MARK: - URL Computed Variable
    
    var url: URL? {
        var components = URLComponents()
        
        components.scheme = Strings.URL.scheme
        components.host = Strings.URL.apiHost
        components.path = path
        
        guard let query = queryItem else {
            return components.url
        }
        
        components.queryItems = query
        
        return components.url
    }
    
    // MARK: Type Dependencies
    
    init(path: String, queryItem: [URLQueryItem]? = nil) {
        self.path = path
        self.queryItem = queryItem
    }
}

extension EndPoint {
    
    // MARK: - Static Methods
    
    static func getURLRequestWithPath(_ paths: [String], id: String? = nil) -> EndPoint {
        var currentPath = String()
        
        for path in paths {
            currentPath += path.insertSlash(in: path)
        }
        
        if let id = id {
            currentPath += id.insertSlash(in: id)
        }
        
        return EndPoint(path: currentPath)
    }
    
    static func getURLRequestWithQuery(path: String, query: String) -> EndPoint {
        var currentPath = String()
        currentPath = path.insertSlash(in: path)
        
        let query = [
            URLQueryItem(name: Strings.URL.queryID, value: query)
        ]
        
        return EndPoint(path: currentPath, queryItem: query)
    }
}
