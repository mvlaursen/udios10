//
//  ViewController.swift
//  StylinObjects
//
//  Created by Mike Laursen on 7/26/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var button1: UIButton!
    @IBOutlet private weak var button2: UIButton!
    @IBOutlet private weak var image1: UIImageView!
    @IBOutlet private weak var image2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        image1.layer.borderColor = UIColor.blue.cgColor
        image1.layer.borderWidth = 5.0
        image1.layer.cornerRadius = 20.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

