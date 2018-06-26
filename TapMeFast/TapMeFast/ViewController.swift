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
        tapMeButton.alpha = 0.5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startGame(_ sender: Any) {
        var startCountdown = 5
        
        self.score = 0
        self.scoreLabel.text = String(self.score)
        self.startGameButton.alpha = 0.5
        self.startGameButton.isEnabled = false
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (startTimer) in
            if startCountdown <= 0 {
                startTimer.invalidate()
                
                var tapCountdown = 5
                
                self.tapMeButton.alpha = 1
                self.tapMeButton.isEnabled = true
                
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (tapTimer) in
                    if tapCountdown <= 0 {
                        tapTimer.invalidate()
                        
                        self.startGameButton.alpha = 1
                        self.startGameButton.isEnabled = true
                        self.tapMeButton.alpha = 0.5
                        self.tapMeButton.isEnabled = false
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
}

