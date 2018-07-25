//
//  ViewController.swift
//  EVCManual
//
//  Created by Mike Laursen on 7/25/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet private weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let manualUrl = Bundle.main.bundleURL.appendingPathComponent("97Eurovan.pdf")
        let request = URLRequest(url: manualUrl)
        webView.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

