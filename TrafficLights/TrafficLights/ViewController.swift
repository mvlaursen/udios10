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
        case Stopped
        case Yellow
    }
    
 //   var countdownTimer:Timer? = nil
    var score:Int = 0
    var scoreTimer:Timer? = nil
    var trafficLightState = TrafficLightState.Stopped
    
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
        if trafficLightState == TrafficLightState.Stopped {
            score = 0
            scoreLabel.text = String(score)

            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(doTrafficLightCountDown), userInfo: nil, repeats: true)
            
            startStopButton.isEnabled = false
        } else {
            scoreTimer?.invalidate()
            startStopButton.setTitle("Start", for: .normal)
            trafficLight.image = UIImage(named: "TrafficLight")
            trafficLightState = TrafficLightState.Stopped
        }
    }
    
    @objc func doTrafficLightCountDown(timer: Timer) {
        switch trafficLightState {
        case TrafficLightState.Green: do {
            startStopButton.isEnabled = true
            startStopButton.setTitle("Stop", for: .normal)

            timer.invalidate()
            scoreTimer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(updateScoreTimer), userInfo: nil, repeats: true)
            }
        case TrafficLightState.Red: do {
            startStopButton.setTitle("Steady", for: .normal)
            trafficLight.image = UIImage(named: "TrafficLight2")
            trafficLightState = TrafficLightState.Yellow
            }
        case TrafficLightState.Stopped: do {
            startStopButton.setTitle("Ready", for: .normal)
            trafficLight.image = UIImage(named: "TrafficLight3")
            trafficLightState = TrafficLightState.Red
            }
        case TrafficLightState.Yellow: do {
            startStopButton.setTitle("Go", for: .normal)
            trafficLight.image = UIImage(named: "TrafficLight1")
            trafficLightState = TrafficLightState.Green
            }
        }
    }
    
    @objc func updateScoreTimer() {
        score += 1
        scoreLabel.text = String(score)
    }
}

