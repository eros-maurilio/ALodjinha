struct CategoryModel: Decodable {
    let id: Int
    let categoryName: String
    let imageURL: String
}

private extension CategoryModel {
    enum CodingKeys: String, CodingKey {
        case id
        case categoryName = "descricao"
        case imageURL = "urlImagem"
    }
}
