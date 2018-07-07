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
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var inputSlider: UISlider!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var thermometerView: UIImageView!

    let MIN_C_VALUE: Float = -20
    let MAX_C_VALUE: Float = 65
    let DEFAULT_C_VALUE: Float = 23
    
    let MIN_F_VALUE: Float = 0
    let MAX_F_VALUE: Float = 150
    let DEFAULT_F_VALUE: Float = 73

    enum ConversionDirection {
    case celsiusToFahrenheit
    case fahrenheitToCelsius
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        conversionDirectionSeg.selectedSegmentIndex = 0
        inputSlider.minimumValue = MIN_F_VALUE
        inputSlider.maximumValue = MAX_F_VALUE
        inputSlider.value = DEFAULT_F_VALUE
        updateView(direction: .fahrenheitToCelsius, input: DEFAULT_F_VALUE)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculate(_ sender: Any) {
        self.resignFirstResponder()
        
        var conversionDirection: ConversionDirection = .fahrenheitToCelsius
        var input: Float = DEFAULT_F_VALUE

        if conversionDirectionSeg.selectedSegmentIndex == 0 {
            conversionDirection = .fahrenheitToCelsius
            input = inputSlider.value
        } else if conversionDirectionSeg.selectedSegmentIndex == 1 {
            conversionDirection = .celsiusToFahrenheit
            input = inputSlider.value
        }
        
        updateView(direction: conversionDirection, input: input)
    }
    
    @IBAction func formatAction(_ sender: Any) {
        if conversionDirectionSeg.selectedSegmentIndex == 0 {
            inputSlider.minimumValue = MIN_F_VALUE
            inputSlider.maximumValue = MAX_F_VALUE
            inputSlider.value = DEFAULT_F_VALUE
            updateView(direction: .fahrenheitToCelsius, input: DEFAULT_F_VALUE)
        } else if conversionDirectionSeg.selectedSegmentIndex == 1 {
            inputSlider.minimumValue = MIN_C_VALUE
            inputSlider.maximumValue = MAX_C_VALUE
            inputSlider.value = DEFAULT_C_VALUE
            updateView(direction: .celsiusToFahrenheit, input: DEFAULT_C_VALUE)
        }
    }
    
    func updateView(direction: ConversionDirection, input: Float) {
        var c: Float = 0
        var f: Float = 0
        
        if direction == .celsiusToFahrenheit {
            c = input
            f = (9 * c) / 5 + 32
        } else if direction == .fahrenheitToCelsius {
            f = input
            c = (5 * (f - 32)) / 9
        }
        
        let cAsString: String = String(format: "%4.1f Celsius", c)
        let fAsString: String = String(format: "%4.1f Fahrenheit", f)
        
        if direction == .celsiusToFahrenheit {
            inputLabel.text = cAsString
            outputLabel.text = fAsString
        } else if direction == .fahrenheitToCelsius {
            inputLabel.text = fAsString
            outputLabel.text = cAsString
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

