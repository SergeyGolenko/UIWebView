//
//  ViewController.swift
//  UIWebView
//
//  Created by Sergey Golenko on 04/09/2019.
//  Copyright © 2019 Sergey Golenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var goBackItem: UIBarButtonItem!
    
    @IBOutlet weak var goForwardItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        
        webView.delegate = self
        
        if let myUrl = URL(string: "https://www.google.com.ua") {
        let request = URLRequest(url: myUrl)
        webView.loadRequest(request)
            print(myUrl.port, myUrl.user , myUrl.scheme )
        }
        
        
    }
    
    // MARK: - UIWebViewDelegate

    func webViewDidStartLoad(_ webView: UIWebView) {
        self.goBackItem.isEnabled = false
        self.goForwardItem.isEnabled = false
    }
    
    
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        if webView.canGoBack {
        self.goBackItem.isEnabled = true
    }
        if webView.canGoForward {
            self.goForwardItem.isEnabled = true
        }
    }
    
 
    
    
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        return true
    }
    // MARK: - Action
    @IBAction func goBackAction(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    
    
    @IBAction func goForwardAction(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    
    
    
    @IBAction func refreshAction(_ sender: Any) {
        webView.reload()
    }
    
    
}


