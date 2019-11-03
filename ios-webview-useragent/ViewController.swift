//
//  ViewController.swift
//  ios-webview-useragent
//
//  Created by なかた(@nkt0615) on 2019/11/03.
//  Copyright © 2019 なかた(@nkt0615). All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
    }

    private func setupWebView() {
        let config = WKWebViewConfiguration()
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        config.applicationNameForUserAgent = "sample/\(version)"

        self.webView = WKWebView(frame: self.containerView.bounds, configuration: config)
        self.webView.navigationDelegate = self
        self.webView.uiDelegate = self
        self.webView.allowsBackForwardNavigationGestures = true
        self.webView.scrollView.bounces = true
        self.containerView.addSubview(self.webView)
        let urlRequest = URLRequest(url: URL(string: "https://www.google.com/")!)
        self.webView.load(urlRequest)
    }
}

extension ViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    }
}

extension ViewController: WKUIDelegate {
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration,
                 for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        return nil
    }
}
