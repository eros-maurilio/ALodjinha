protocol ViewModelProtocol: AnyObject {
    func loadFromAPI()
}

protocol LoadContentable: AnyObject {
    func didLoad()
    func showMore(id: String)
}
