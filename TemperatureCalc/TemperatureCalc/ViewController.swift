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
    
    enum ConversionFormat {
    case celsiusToFahrenheit
    case fahrenheitToCelsius
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        formatSeg.selectedSegmentIndex = 0
        updateViewForFormat(format: .celsiusToFahrenheit)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculate(_ sender: Any) {
        self.resignFirstResponder()
        
        if formatSeg.selectedSegmentIndex == 0 {
            let f = Double(textField.text!)
            let c = (5 * (f! - 32)) / 9
            outputLabel.text = String(c)
        } else if formatSeg.selectedSegmentIndex == 1 {
            var c = Double(textField.text!)
            let f = (9 * c!) / 5 + 32
            outputLabel.text = String(f)
        }
    }
    
    @IBAction func formatAction(_ sender: Any) {
        if formatSeg.selectedSegmentIndex == 0 {
            updateViewForFormat(format: .celsiusToFahrenheit)
        } else if formatSeg.selectedSegmentIndex == 1 {
            updateViewForFormat(format: .fahrenheitToCelsius)
        }
    }
    
    func updateViewForFormat(format: ConversionFormat) {
        if (format == .celsiusToFahrenheit) {
            enterLabel.text = "Enter Fahrenheit"
            outputLabel.text = "0 Celsius"
            textField.text = ""
        } else if (format == .fahrenheitToCelsius) {
            enterLabel.text = "Enter Celsius"
            outputLabel.text = "0 Fahrenheit"
            textField.text = ""
        }
    }
}

