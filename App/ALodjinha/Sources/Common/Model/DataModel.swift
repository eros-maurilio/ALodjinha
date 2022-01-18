struct DataModel: Decodable {
    let id: Int
    let nome: String?
    let urlImagem: String
    let descricao: String?
    let precoDe: Float?
    let precoPor: Float?
    let categoria: Categoria?
    let linkUrl: String?
}

struct Categoria: Decodable {
    let id: Int
    let descricao: String
    let urlImagem: String
}
