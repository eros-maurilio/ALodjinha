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
    
    // MARK: - API Request Data Methods
    
    static func urlRequestWithPath(_ paths: [String], id: String? = nil) -> EndPoint {
        var currentPath = String()
        
        for path in paths {
            currentPath += path.insertSlash(in: path)
        }
        
        if let id = id {
            currentPath += id.insertSlash(in: id)
        }
        
        return EndPoint(path: currentPath)
    }
    
    static func urlRequestWithQuery(path: String, query: String) -> EndPoint {
        var currentPath = String()
        currentPath = path.insertSlash(in: path)
        
        let query = [
            URLQueryItem(name: Strings.URL.queryID, value: query)
        ]
        
        return EndPoint(path: currentPath, queryItem: query)
    }
    
    // MARK: - API Post Request Method

    static func postRequest(for id: String) -> EndPoint {
        var path = Strings.URL.productPath
        var productID = id
        path = path.insertSlash(in: path)
        productID = productID.insertSlash(in: productID)
        
        path += productID
        
        return EndPoint(path: path)

    }
}
