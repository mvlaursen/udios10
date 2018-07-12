//
//  ViewController.swift
//  UIViews
//
//  Created by Mike Laursen on 7/11/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view1.isHidden = true
        view2.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func hideView1(_ sender: Any) {
        view1.isHidden = true
    }
    
    @IBAction func hideView2(_ sender: Any) {
        view2.isHidden = true
    }

    @IBAction func showView1(_ sender: Any) {
        view1.isHidden = false
    }
    
    @IBAction func showView2(_ sender: Any) {
        view2.isHidden = false
    }
}

