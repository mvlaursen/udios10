//
//  ViewController.swift
//  Randomness
//
//  Created by Mike Laursen on 6/27/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var statsView: UITextView!
    
    var stats:Dictionary<UInt32, UInt32> = [2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rollDice(_ sender: Any) {
        let u = rollDie() + rollDie()
        stats[u] = max(0, stats[u]!) + 1
        result.text = String(u)
        
        var statsReport = String()
        for index:UInt32 in 2...12 {
            statsReport.append("\(index): ")
            var column:uint = 0
            while column < stats[index]! {
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
