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
        
        var c: Double = 0
        var f: Double = 0

        if formatSeg.selectedSegmentIndex == 0 {
            f = Double(textField.text!) ?? 0
            c = (5 * (f - 32)) / 9
            outputLabel.text = String(format: "%4.1f Celsius", c)
        } else if formatSeg.selectedSegmentIndex == 1 {
            c = Double(textField.text!) ?? 0
            f = (9 * c) / 5 + 32
            outputLabel.text = String(format: "%4.1f Fahrenheit", f)
        }
        
        if f < 16 {
            imageView.image = UIImage(named: "Temp1.png")
        } else if f < 32 {
            imageView.image = UIImage(named: "Temp2.png")
        } else if f < 48 {
            imageView.image = UIImage(named: "Temp3.png")
        } else if f < 64 {
            imageView.image = UIImage(named: "Temp4.png")
        } else if f < 80 {
            imageView.image = UIImage(named: "Temp5.png")
        } else if f < 96 {
            imageView.image = UIImage(named: "Temp6.png")
        } else if f < 108 {
            imageView.image = UIImage(named: "Temp7.png")
        } else if f < 120 {
            imageView.image = UIImage(named: "Temp8.png")
        } else {
            imageView.image = UIImage(named: "Temp9.png")
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

