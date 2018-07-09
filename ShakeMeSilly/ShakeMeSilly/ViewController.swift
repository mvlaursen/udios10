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
    
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startGame(_ sender: Any) {
        startButton.isEnabled = false
        
        var countdown = COUNTDOWN
        timerLabel.text = String(countdown)

        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            countdown -= 1
            self.timerLabel.text = String(countdown)
            
            if countdown == 0 {
                timer.invalidate()
                self.startButton.isEnabled = true
            }
        }
    }
}

