//
//  ViewController.swift
//  TemperatureCalc
//
//  Created by Mike Laursen on 6/29/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var enterLabel: UILabel!
    @IBOutlet weak var formatSeg: UISegmentedControl!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculate(_ sender: Any) {
        self.resignFirstResponder()
    }
    
    @IBAction func formatAction(_ sender: Any) {
        if formatSeg.selectedSegmentIndex == 0 {
            enterLabel.text = "Enter Fahrenheit"
            outputLabel.text = "0 Celsius"
            textField.text = ""
        } else if formatSeg.selectedSegmentIndex == 1 {
            enterLabel.text = "Enter Celsius"
            outputLabel.text = "0 Fahrenheit"
            textField.text = ""
        }
    }
}

