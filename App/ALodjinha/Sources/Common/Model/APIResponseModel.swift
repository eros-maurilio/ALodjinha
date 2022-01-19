import Foundation

typealias APIResult = Result<APIResponse, NSError>

struct APIResponse: Decodable {
    let data: [DataModel]
}
