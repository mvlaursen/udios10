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
    
    private let CARD_LIST = ["2_of_hearts", "3_of_hearts", "4_of_hearts", "5_of_hearts", "6_of_hearts", "7_of_hearts", "8_of_hearts", "9_of_hearts", "10_of_hearts", "jack_of_hearts", "queen_of_hearts", "king_of_hearts", "ace_of_hearts"]
    private let COUNTDOWN_START = 20
    
    private var cardTimer: Timer? = nil
    private var countdown = 0
    private var countdownTimer: Timer? = nil
    private var gameMode = 0 // 0 =
    private var scoreInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        reset()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        if countdown == COUNTDOWN_START {
            button.setTitle("Snap", for: .normal)
            
            cardTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
                let leftIndex = arc4random_uniform(UInt32(self.CARD_LIST.count))
                let rightIndex = arc4random_uniform(UInt32(self.CARD_LIST.count))
                self.leftCard.image = UIImage(named: self.CARD_LIST[Int(leftIndex)])
                self.rightCard.image = UIImage(named: self.CARD_LIST[Int(rightIndex)])
            })
            
            countdownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
                self.countdown -= 1
                self.updateScoreboard()
                
                if self.countdown == 0 {
                    self.cardTimer!.invalidate()
                    self.countdownTimer!.invalidate()
                    self.button.setTitle("Reset", for: .normal)
                }
            })
        } else if countdown == 0 {
            reset()
        }
    }
    
    func reset() {
        button.setTitle("Start", for: .normal)
        leftCard.image = UIImage(named: "blue_cover")
        rightCard.image = UIImage(named: "red_cover")
        scoreInt = 0
        countdown = COUNTDOWN_START
        updateScoreboard()
    }
    
    func updateScoreboard() {
        scoreLabel.text = String("Score: \(scoreInt)")
        timeLabel.text = String("Time: \(countdown)")
    }
}

