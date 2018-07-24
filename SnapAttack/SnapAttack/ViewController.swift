//
//  ViewController.swift
//  SnapAttack
//
//  Created by Mike Laursen on 7/24/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var button: UIButton!
    @IBOutlet private weak var leftCard: UIImageView!
    @IBOutlet private weak var rightCard: UIImageView!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    
    private let COUNTDOWN_START = 20
    
    var cardTimer: Timer? = nil
    var countdown = 0
    var countdownTimer: Timer? = nil
    var gameMode = 0 // 0 =
    var scoreInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        button.setTitle("Start", for: .normal)
        scoreInt = 0
        countdown = COUNTDOWN_START
        updateScoreboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        if countdown == COUNTDOWN_START {
            button.setTitle("Snap", for: .normal)
            countdownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
                self.countdown -= 1
                self.updateScoreboard()
                
                if self.countdown == 0 {
                    self.countdownTimer!.invalidate()
                    self.button.setTitle("Reset", for: .normal)
                }
            })
        } else if countdown == 0 {
            button.setTitle("Start", for: .normal)
            scoreInt = 0
            countdown = 20
            updateScoreboard()
        }
    }
    
    func updateScoreboard() {
        scoreLabel.text = String("Score: \(scoreInt)")
        timeLabel.text = String("Time: \(countdown)")
    }
}

