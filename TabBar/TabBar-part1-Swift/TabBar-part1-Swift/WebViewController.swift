//
//  SecondViewController.swift
//  TabBar-part1-Swift
//
//  Created by Neil Taylor on 10/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    
    @IBOutlet weak var webView: UIWebView!
    
    func showNetworkActivityIndicator(value: Bool) {
        let app = UIApplication.sharedApplication();
        app.networkActivityIndicatorVisible = value;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let url = NSURL(string: "http://www.apple.com/") {
            self.webView?.loadRequest(NSURLRequest(URL: url))
            self.webView?.delegate = self
            showNetworkActivityIndicator(true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        print("Handle the load operation...")
        showNetworkActivityIndicator(false)
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print("failed... \(error)")
        showNetworkActivityIndicator(false)
    }
}

