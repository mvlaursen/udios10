//
//  ViewController.swift
//  TemperatureCalc
//
//  Created by Mike Laursen on 6/29/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var conversionDirectionSeg: UISegmentedControl!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var thermometerView: UIImageView!

    let DEFAULT_C_ENTRY: String = "23"
    let DEFAULT_F_ENTRY: String = "73"
    
    enum ConversionDirection {
    case celsiusToFahrenheit
    case fahrenheitToCelsius
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        conversionDirectionSeg.selectedSegmentIndex = 0
        inputField.text = DEFAULT_F_ENTRY
        updateView(direction: .fahrenheitToCelsius, input: DEFAULT_F_ENTRY)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculate(_ sender: Any) {
        self.resignFirstResponder()
        
        var conversionDirection: ConversionDirection = .fahrenheitToCelsius
        var input: String = DEFAULT_F_ENTRY

        if conversionDirectionSeg.selectedSegmentIndex == 0 {
            conversionDirection = .fahrenheitToCelsius
            input = inputField.text ?? DEFAULT_F_ENTRY
        } else if conversionDirectionSeg.selectedSegmentIndex == 1 {
            conversionDirection = .celsiusToFahrenheit
            input = inputField.text ?? DEFAULT_C_ENTRY
        }
        
        updateView(direction: conversionDirection, input: input)
    }
    
    @IBAction func formatAction(_ sender: Any) {
        if conversionDirectionSeg.selectedSegmentIndex == 0 {
            inputField.text = DEFAULT_F_ENTRY
            updateView(direction: .fahrenheitToCelsius, input: DEFAULT_F_ENTRY)
        } else if conversionDirectionSeg.selectedSegmentIndex == 1 {
            inputField.text = DEFAULT_C_ENTRY
            updateView(direction: .fahrenheitToCelsius, input: DEFAULT_C_ENTRY)
        }
    }
    
    func updateView(direction: ConversionDirection, input: String) {
        var c: Double = 0
        var f: Double = 0
        
        if direction == .celsiusToFahrenheit {
            c = Double(input) ?? 0
            f = (9 * c) / 5 + 32
            inputLabel.text = "Enter Celsius"
            outputLabel.text = String(format: "%4.1f Fahrenheit", f)
        } else if direction == .fahrenheitToCelsius {
            f = Double(input) ?? 0
            c = (5 * (f - 32)) / 9
            inputLabel.text = "Enter Fahrenheit"
            outputLabel.text = String(format: "%4.1f Celsius", c)
        }
        
        if f < 16 {
            thermometerView.image = UIImage(named: "Temp1.png")
        } else if f < 32 {
            thermometerView.image = UIImage(named: "Temp2.png")
        } else if f < 48 {
            thermometerView.image = UIImage(named: "Temp3.png")
        } else if f < 64 {
            thermometerView.image = UIImage(named: "Temp4.png")
        } else if f < 80 {
            thermometerView.image = UIImage(named: "Temp5.png")
        } else if f < 96 {
            thermometerView.image = UIImage(named: "Temp6.png")
        } else if f < 108 {
            thermometerView.image = UIImage(named: "Temp7.png")
        } else if f < 120 {
            thermometerView.image = UIImage(named: "Temp8.png")
        } else {
            thermometerView.image = UIImage(named: "Temp9.png")
        }
    }
}

