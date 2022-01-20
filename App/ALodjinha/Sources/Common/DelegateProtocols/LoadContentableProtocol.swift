protocol SearchViewDelegate: AnyObject {
    func didLoad()
}

protocol LoadContentable: SearchViewDelegate {
    func showMore(id: String)
}

