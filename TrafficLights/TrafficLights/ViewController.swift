//
//  ViewController.swift
//  TrafficLights
//
//  Created by Mike Laursen on 6/25/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var trafficLight: UIImageView!
    
    var countdownTimer:Timer? = nil
    var score:Int = 0
    var scoreTimer:Timer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scoreLabel.text = String(score)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startStop(_ sender: Any) {
        if score == 0 {
            let userInfo = NSMutableDictionary()
            userInfo["countdown"] = Int(2)
            countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: userInfo, repeats: true)
        } else {
            score = 0
            scoreLabel.text = "0"
            scoreTimer?.invalidate()
        }
    }
    
    @objc func countDown(timer: Timer) {
        let userInfo = timer.userInfo as! NSMutableDictionary
        let countdown = userInfo["countdown"] as! Int
        
        switch countdown {
        case 0: do {
            countdownTimer?.invalidate()
            scoreTimer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(updateScoreTimer), userInfo: nil, repeats: true)
            startStopButton.titleLabel?.text = "Stop"
            trafficLight.image = UIImage(named: "TrafficLight1")
            }
        case 1: trafficLight.image = UIImage(named: "TrafficLight2")
        case 2: trafficLight.image = UIImage(named: "TrafficLight3")
        default: fatalError()
        }

        userInfo["countdown"] = countdown - 1
    }
    
    @objc func updateScoreTimer() {
        score += 1
        scoreLabel.text = String(score)
    }
}

