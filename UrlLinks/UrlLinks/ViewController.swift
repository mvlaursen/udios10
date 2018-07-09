//
//  ViewController.swift
//  UrlLinks
//
//  Created by Mike Laursen on 7/9/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showUrl(_ sender: Any) {
        let url = URL(string: "http://www.laursen.org/")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
}

