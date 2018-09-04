//
//  ViewController.swift
//  S16SeparateStoryboards
//
//  Created by Mike Laursen on 9/4/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func hello(_ sender: UIButton) {
        label.text = "Hello!"
    }
    
}

