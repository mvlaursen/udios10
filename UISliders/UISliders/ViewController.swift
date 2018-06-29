//
//  ViewController.swift
//  UISliders
//
//  Created by Mike Laursen on 6/29/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var fontSizeSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func alphaAction(_ sender: Any) {
        label.alpha = CGFloat(alphaSlider.value)
    }
    
    @IBAction func fontSizeAction(_ sender: Any) {
        label.font = UIFont(name: "Verdana", size: CGFloat(fontSizeSlider.value))
    }
}

