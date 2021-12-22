//
//  AuthViewController.swift
//  gb-course-3
//
//  Created by Данила Лазин on 22.12.2021.
//

import UIKit
import WebKit

class AuthViewController: UIViewController, WKNavigationDelegate {
    private let clientId: String = "7822904"
    private let scope: String = "262150"

    
    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        authToVk()
    }
    
    func authToVk() {
        let url = URL(string: "https://oauth.vk.com/authorize?client_id=\(clientId)&display=mobile&redirect_uri=https://oauth.vk.com/blank.html&scope=\(scope)&response_type=token&v=\(Session.shared.version)")!
        
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String](), { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            })
        
        Session.shared.tokenId = params["access_token"]
        Session.shared.userId = Int(params["user_id"]!)
        
        if (Session.shared.tokenId != nil) {
            performSegue(withIdentifier: "unwindAuthSegue", sender: self)
        }
        
        decisionHandler(.cancel)
    }
    

}
