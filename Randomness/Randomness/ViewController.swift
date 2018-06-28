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
    
    let NUM_ROLLS: UInt32 = 180
    let TIME_INTERVAL: TimeInterval = 0.2
    let DICE_WORDS: Array<String> = ["Snake eyes!", "Three", "Four", "Five", "Six",
        "Seven", "Eight", "Nine", "Ten", "Yo-leven!", "Box cars!"]
    
    var stats: [UInt32:UInt32] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.doStatsReport()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rollDiceAction(_ sender: Any) {
        var rollCount: UInt32 = 0
        stats = [:]
        
        Timer.scheduledTimer(withTimeInterval: TIME_INTERVAL, repeats: true, block: { (timer) in
            if rollCount >= self.NUM_ROLLS {
                timer.invalidate()
            } else {
                rollCount += 1
            }
            
            let diceValue = self.rollDiceAndCollectStats()
            self.diceValueLabel.text = self.DICE_WORDS[Int(diceValue) - 2]
            self.doStatsReport()
           })
        
    }
    
    func doStatsReport() {
        var statsReport = String()
        for index: UInt32 in 2...12 {
            let prettyIndex = String(format: "%2 u", index)
            statsReport.append("\(prettyIndex): ")
            for _: UInt32 in 0..<(stats[index] ?? 0) {
                statsReport.append("=")
            }
            statsReport.append("\n")
        }
        statsView.text = statsReport
    }
    
    func rollDiceAndCollectStats() -> UInt32 {
        let diceValue = rollDie() + rollDie()
        stats[diceValue] = (stats[diceValue] ?? 0) + 1
        return diceValue
    }
    
    func rollDie() -> UInt32 {
        return arc4random_uniform(6) + 1
    }
}
