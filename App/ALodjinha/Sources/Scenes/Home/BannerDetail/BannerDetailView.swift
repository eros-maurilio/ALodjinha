import UIKit
import WebKit

class BannerDetailView: UIViewController {
    
    // MARK: - Attributes
    
    private var webView: WKWebView!
    private var website = Strings.URL.gitHost
    private var gitOwner = Strings.URL.gitOwnerPath
    
    // MARK: - View's Life Cycle
    
    override func loadView() {
        setupWebView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isToolbarHidden = true
    }
}

    // MARK: - Private Methods

private extension BannerDetailView {
    
    func setupView() {
        setupToolBar()
        loadWebView()
    }
    
    func setupWebView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    func loadWebView() {
        gitOwner = gitOwner.insertSlash(in: gitOwner)
        
        if let url = URL(string: "https://" + website + gitOwner) {
            print(url)
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
            navigationController?.toolbar.tintColor = .purple
        }
    }
    
    func setupToolBar() {
        let back = UIBarButtonItem(barButtonSystemItem: .reply, target: webView, action: #selector(webView.goBack))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
                
        toolbarItems = [back, spacer, refresh]
    }
}

    // MARK: WKNavigationDelegate

extension BannerDetailView: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        if let host = url?.host {
            if host.contains(website) {
                decisionHandler(.allow)
                navigationController?.isToolbarHidden = false
                return
            }
        }
        decisionHandler(.cancel)
    }
}
