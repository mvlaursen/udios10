//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Aaron on 06/09/2016.
//  Copyright © 2016 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var label: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func displayText(_ sender: AnyObject) {
        
        label.text = "Hello"
        
        
    }
    
    
    

}

