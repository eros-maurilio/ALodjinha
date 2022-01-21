import Foundation

final class DataPost {
    
    // MARK: - SharedSession
    
    private var sharedSession: URLSession { URLSession.shared }
    
    // MARK: - Main Method
    
    func make(_ endPoint: EndPoint, completion: @escaping(Result<String, NSError>) -> Void) {
        
        guard let url = endPoint.url else { return }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = Strings.URL.post
        let body: [String: AnyHashable] = [:]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = sharedSession.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                
                if let jsonReponse = response as? [String: String] {
                    for postResponse in jsonReponse {
                        
                        if postResponse.key == "mensagem" {
                            completion(.success(postResponse.value))
                        }
                        
                        if postResponse.value == "success" {
                            completion(.success("Produto reservado com sucesso!"))
                        }
                    }
                }
            }
            
            catch {
                completion(.failure(NSError(domain: "", code: 000, userInfo: ["Message": "Não foi possível reservar o produto"])))
            }
        }
        task.resume()
    }
}
