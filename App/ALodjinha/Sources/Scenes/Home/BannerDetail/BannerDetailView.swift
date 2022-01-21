import UIKit
import WebKit

class BannerDetailView: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    let website = "github.com"
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://" + website + "/eros-maurilio") {
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
            navigationController?.toolbar.tintColor = .purple
        }
        
        let back = UIBarButtonItem(barButtonSystemItem: .reply, target: webView, action: #selector(webView.goBack))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
                
        toolbarItems = [back, spacer, refresh]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isToolbarHidden = true
    }
    
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
