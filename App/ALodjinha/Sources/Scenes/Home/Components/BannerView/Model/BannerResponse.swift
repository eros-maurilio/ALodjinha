struct BannerResponse: Decodable {
    let data: [DataModel]
}

struct DataModel: Decodable {
    let id: Int
    let urlImagem: String
    let linkUrl: String
}
