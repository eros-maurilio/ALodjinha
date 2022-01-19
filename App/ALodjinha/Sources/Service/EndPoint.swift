import Foundation

struct EndPoint {
    let path: String
    let queryItem: [URLQueryItem]?
    
    var url: URL? {
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "alodjinha.herokuapp.com"
        components.path = path
        
        guard let query = queryItem else {
            return components.url
        }
        
        components.queryItems = query

        
        return components.url
    }
    
    init(path: String, queryItem: [URLQueryItem]? = nil) {
        self.path = path
        self.queryItem = queryItem
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
    
    static func getURLRequestWithQuery(path: String, query: String) -> EndPoint {
        let query = [
            URLQueryItem(name: "categoriaId", value: query)
        ]
        
        print(query)
        print(path)
        
        return EndPoint(path: path, queryItem: query)
    }
}
