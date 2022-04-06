import Foundation

protocol DataLoaderProtocol {
    func  make<T: Decodable>(_ endPoint: EndPoint, completion: @escaping(Result<T, NSError>) -> Void)
}

final class DataLoader: DataLoaderProtocol {
    
    // MARK: - SharedSession
    
    private var sharedSession: URLSession { URLSession.shared}
    
    // MARK: - Main Method
    
    func  make<T: Decodable>(_ endPoint: EndPoint, completion: @escaping(Result<T, NSError>) -> Void) {
        
        guard let url = endPoint.url else {
            return completion(.failure(NSError(domain: "", code: 000, userInfo: ["Message": "Invalid URL"])))
        }
        
        debugPrint(url)
        
        let task = sharedSession.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(NSError(domain: "", code: 000, userInfo: ["Message" : error.localizedDescription])))
                return
            }
            
            guard let data = data else {
                return completion(.failure(NSError(domain: "", code: 000, userInfo: ["Message": "Can't get Data"])))
            }
            
            do {
                 let parsedData = try JSONDecoder().decode(T.self, from: data)
                 completion(.success(parsedData))
                 return

             } catch DecodingError.keyNotFound(let key, let context) {
                 Swift.debugPrint("could not find key \(key) in JSON: \(context.debugDescription)")

             } catch DecodingError.valueNotFound(let type, let context) {
                 Swift.debugPrint("could not find type \(type) in JSON: \(context.debugDescription)")

             } catch DecodingError.typeMismatch(let type, let context) {
                 Swift.debugPrint("type mismatch for type \(type) in JSON: \(context.debugDescription)")

             } catch DecodingError.dataCorrupted(let context) {
                 Swift.debugPrint("data found to be corrupted in JSON: \(context.debugDescription)")

             } catch let error as NSError {
                 NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
             }
        }
        task.resume()
    }
}
