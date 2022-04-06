import Foundation

final class DataPost {
    
    // MARK: - SharedSession
    
    private var sharedSession: URLSession { URLSession.shared }
    
    // MARK: - Main Method
    
    func make(_ endPoint: EndPoint, completion: @escaping(Result<String, Error>) -> Void) {
        
        guard let url = endPoint.url else { return }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = Strings.URL.post
        let body: [String: AnyHashable] = [:]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = sharedSession.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(DataFetchinError.noData))
                return
            }
            
            do {
                let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                let decoded = try JSONDecoder().decode(Response.self, from: data)
                if (decoded.result == "success") {
                    completion(.success("Produto reservado com sucesso!"))
                } else {
                    completion(.failure(DataFetchinError.invalidResponse))
                }
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

enum DataFetchinError: Error {
    case invalidResponse
    case noData
}

private struct Response: Decodable {
    let result: String
}
