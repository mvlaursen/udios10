//
//  ViewController.swift
//  Randomness
//
//  Created by Mike Laursen on 6/27/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var diceValueLabel: UILabel!
    @IBOutlet weak var statsView: UITextView!
    
    var stats: [UInt32:UInt32] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rollDice(_ sender: Any) {
        let diceValue = rollDie() + rollDie()
        stats[diceValue] = stats[diceValue] ?? 0 + 1
        
        diceValueLabel.text = String(diceValue)
        
        var statsReport = String()
        for index:UInt32 in 2...12 {
            statsReport.append("\(index): ")
            var column:uint = 0
            while column < stats[index] ?? 0 {
                statsReport.append("=")
                column += 1
            }
            statsReport.append("\n")
        }
        statsView.text = statsReport
    }
    
    func rollDie() -> UInt32 {
        return arc4random_uniform(6) + 1
    }
}
