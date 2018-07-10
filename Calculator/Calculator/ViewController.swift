//
//  ViewController.swift
//  Calculator
//
//  Created by Mike Laursen on 7/9/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var accumulator: Double = 0
    var displayValue: Double = 0
    var operation: String = "="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculate(_ sender: AnyObject) {
        switch operation {
        case "+": accumulator += displayValue
        case "*": accumulator *= displayValue
        case "-": accumulator -= displayValue
        case "/": accumulator = accumulator / displayValue
        default: break
        }
        
        setDisplay(value: accumulator)
    }
    
    @IBAction func clear(_ sender: Any) {
        accumulator = 0
        setDisplay(value: 0)
        operation = "="
    }
    
    @IBAction func digitTapped(_ sender: AnyObject) {
        let buttonTitle: String = sender.currentTitle ?? "0"
        let digit: Double = NumberFormatter().number(from: buttonTitle)?.doubleValue ?? 0
        setDisplay(value: displayValue == 0 ? digit : 10 * displayValue + digit)
    }
    
    @IBAction func operation(_ sender: AnyObject) {
        operation = sender.currentTitle ?? "-"
        accumulator = displayValue
        setDisplay(value: 0)
    }
    
    func setDisplay(value: Double) {
        displayValue = value
        display.text = String(format: "%2.0f", value)
    }
}

