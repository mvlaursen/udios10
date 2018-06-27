//
//  ViewController.swift
//  TapMeFast
//
//  Created by Mike Laursen on 6/26/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var tapMeButton: UIButton!
    
    let START_COUNTDOWN_SECONDS:UInt = 5
    let TAP_COUNTDOWN_SECONDS:UInt = 5
    
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        disableButton(button: tapMeButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startGame(_ sender: Any) {
        var startCountdown:UInt = START_COUNTDOWN_SECONDS
        //countdownLabel.text = String(startCountdown)
        startCountdown = countDown(countdown: startCountdown)
        
        self.score = 0
        self.scoreLabel.text = String(self.score)
        disableButton(button: self.startGameButton)
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (startTimer) in
            if startCountdown == 0 {
                startTimer.invalidate()
                
                var tapCountdown:UInt = self.TAP_COUNTDOWN_SECONDS
                self.countdownLabel.text = String(tapCountdown)
                
                self.enableButton(button: self.tapMeButton)
                
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (tapTimer) in
                    if tapCountdown == 0 {
                        self.countdownLabel.text = String(0)
                        tapTimer.invalidate()
                        
                        self.enableButton(button: self.startGameButton)
                        self.disableButton(button: self.tapMeButton)
                    } else {
                        tapCountdown = self.countDown(countdown: tapCountdown)
                    }
                })
            } else {
                startCountdown = self.countDown(countdown: startCountdown)
            }
        })
    }
    
    @IBAction func tapMe(_ sender: Any) {
        score += 1
        scoreLabel.text = String(score)
    }
    
    func countDown(countdown:UInt) -> UInt {
        countdownLabel.text = String(countdown)
        
        if countdown > 0 {
            return countdown - 1
        } else {
            return 0
        }
    }

    func disableButton(button:UIButton) {
        button.alpha = 0.5
        button.isEnabled = false
    }
    
    func enableButton(button:UIButton) {
        button.alpha = 1
        button.isEnabled = true
    }
}

