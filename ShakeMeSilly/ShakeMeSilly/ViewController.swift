//
//  ViewController.swift
//  ShakeMeSilly
//
//  Created by Mike Laursen on 7/9/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var maracaImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    let COUNTDOWN: Int = 10
    
    var isPlaying: Bool = false
    var maracaIndex: Int = 1
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake && isPlaying {
            score += 1
            scoreLabel.text = String(score)
            
            maracaIndex += 1
            maracaImage.image = UIImage(named: "Maracas\(maracaIndex).png")
            if maracaIndex == 4 {
                maracaIndex = 0
            }
        }
    }
    
    @IBAction func startGame(_ sender: Any) {
        startButton.alpha = 0.5
        startButton.isEnabled = false
        
        var countdown = COUNTDOWN
        timerLabel.text = String(countdown)
        
        isPlaying = true
        score = 0
        scoreLabel.text = "0"

        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            countdown -= 1
            self.timerLabel.text = String(countdown)
            
            if countdown == 0 {
                timer.invalidate()
                self.isPlaying = false
                self.maracaImage.image = UIImage(named: "Maracas1.png")
                self.startButton.alpha = 0.75
                self.startButton.isEnabled = true
            }
        }
    }
}

