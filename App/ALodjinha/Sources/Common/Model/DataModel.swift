struct DataModel: Decodable {
    let id: Int
    let productName: String?
    let urlImage: String
    let productDescription: String?
    let oldPrice: Float?
    let newPrice: Float?
    let category: CategoryModel?
    let linkUrl: String?
}

private extension DataModel {
    enum CodingKeys: String, CodingKey {
        case id
        case productName = "nome"
        case urlImage = "urlImagem"
        case productDescription = "descricao"
        case oldPrice = "precoDe"
        case newPrice = "precoPor"
        case category = "categoria"
        case linkUrl
    }
}
