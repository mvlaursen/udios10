//
//  ViewController.swift
//  MyFirstApp4Real
//
//  Created by Mike Laursen on 6/22/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func enter(_ sender: Any) {
        label.text = textField.text
        self.resignFirstResponder()
    }
    
    @IBAction func toggleImage(_ sender: Any) {
        imageView.isHidden = !imageView.isHidden
        
        if imageView.isHidden {
            showButton.setTitle("Show", for: .normal)
        } else {
            showButton.setTitle("Hide", for: .normal)
        }
    }
}

