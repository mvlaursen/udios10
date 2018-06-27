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
        var startCountdown = 5
        countdownLabel.text = String(startCountdown)
        
        self.score = 0
        self.scoreLabel.text = String(self.score)
        disableButton(button: self.startGameButton)
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (startTimer) in
            if startCountdown <= 0 {
                startTimer.invalidate()
                
                var tapCountdown = 5
                self.countdownLabel.text = String(tapCountdown)
                
                self.enableButton(button: self.tapMeButton)
                
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (tapTimer) in
                    if tapCountdown <= 0 {
                        tapTimer.invalidate()
                        
                        self.enableButton(button: self.startGameButton)
                        self.disableButton(button: self.tapMeButton)
                    } else {
                        tapCountdown -= 1
                        self.countdownLabel.text = String(tapCountdown)
                    }
                })
            } else {
                startCountdown -= 1
                self.countdownLabel.text = String(startCountdown)
            }
        })
    }
    
    @IBAction func tapMe(_ sender: Any) {
        score += 1
        scoreLabel.text = String(score)
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

