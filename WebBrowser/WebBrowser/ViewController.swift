//
//  ViewController.swift
//  WebBrowser
//
//  Created by Mike Laursen on 7/19/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "http://yahoo.com/")
        let request = URLRequest(url: url!)
        webView.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAction(_ sender: UIBarButtonItem) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func forwardAction(_ sender: UIBarButtonItem) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func refresh(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @IBAction func stop(_ sender: UIBarButtonItem) {
        webView.stopLoading()
    }
}

