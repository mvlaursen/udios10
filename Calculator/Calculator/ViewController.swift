//
//  ViewController.swift
//  Calculator
//
//  Created by Mike Laursen on 7/9/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var readout: UILabel!
    
    var displayValue: Double {
        get {
            return (NumberFormatter().number(from: readout.text!)?.doubleValue)!
        }
        set {
            readout.text = String(format: "%2.0f", newValue)
            isFirstDigit = true
            operation2 = "="
        }
    }
    
    var isFirstDigit: Bool = true
    var operation1: Double = 0
    var operation2: String = "="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculate(_ sender: AnyObject) {
        switch operation2 {
        case "+": displayValue += operation1
        case "*": displayValue *= operation1
        case "-": displayValue -= operation1
        case "/": displayValue = operation1 / displayValue
        default: break
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        displayValue = 0
    }
    
    @IBAction func digitTapped(_ sender: AnyObject) {
        let digit = sender.currentTitle!
        
        readout.text = isFirstDigit ? digit : readout.text! + digit!
        isFirstDigit = false
    }
    
    @IBAction func operation(_ sender: AnyObject) {
        operation2 = sender.currentTitle as! String
        operation1 = displayValue
        isFirstDigit = true
    }
}

