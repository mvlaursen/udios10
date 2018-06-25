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
    
    enum TrafficLightState {
        case Green
        case Red
        case Yellow
    }
    
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
            trafficLight.image = UIImage(named: "TrafficLight3")

            let userInfo = NSMutableDictionary()
            userInfo["state"] = TrafficLightState.Red
            countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(doTrafficLightCountDown), userInfo: userInfo, repeats: true)
        } else {
            score = 0
            scoreLabel.text = "0"
            scoreTimer?.invalidate()
        }
    }
    
    @objc func doTrafficLightCountDown(timer: Timer) {
        let userInfo = timer.userInfo as! NSMutableDictionary
        let state = userInfo["state"] as! TrafficLightState
        
        switch state {
        case TrafficLightState.Green: do {
            startStopButton.titleLabel?.text = "Stop"
            timer.invalidate()
            scoreTimer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(updateScoreTimer), userInfo: nil, repeats: true)
            }
        case TrafficLightState.Red: do {
            trafficLight.image = UIImage(named: "TrafficLight2")
            userInfo["state"] = TrafficLightState.Yellow
            }
        case TrafficLightState.Yellow: do {
            trafficLight.image = UIImage(named: "TrafficLight1")
            userInfo["state"] = TrafficLightState.Green
            }
        }
    }
    
    @objc func updateScoreTimer() {
        score += 1
        scoreLabel.text = String(score)
    }
}

