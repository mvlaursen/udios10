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
    
    private let CARD_LIST = ["2_of_hearts", "7_of_hearts", "ace_of_hearts"]
    private let COUNTDOWN_START = 20
    
    private enum GameState {
    case ready, playing, ended
    }
    
    private var cardTimer: Timer? = nil
    private var countdown = 0
    private var countdownTimer: Timer? = nil
    private var gameState = GameState.ready
    private var leftIndex = -1
     private var rightIndex = -1
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
        switch gameState {
        case .ready:
            button.setTitle("Snap", for: .normal)
        
            cardTimer = Timer.scheduledTimer(withTimeInterval: 1.2, repeats: true, block: { (_) in
                self.leftIndex = Int(arc4random_uniform(UInt32(self.CARD_LIST.count)))
                self.rightIndex = Int(arc4random_uniform(UInt32(self.CARD_LIST.count)))
                self.leftCard.image = UIImage(named: self.CARD_LIST[self.leftIndex])
                self.rightCard.image = UIImage(named: self.CARD_LIST[self.rightIndex])
            })
        
            countdownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
                self.countdown -= 1
                self.updateScoreboard()
            
                if self.countdown == 0 {
                    self.gameState = .ended
                    self.cardTimer!.invalidate()
                    self.countdownTimer!.invalidate()
                    self.button.setTitle("Reset", for: .normal)
                }
            })
            gameState = .playing
            break

        case .playing:
            // TODO: This isn't quite right. When the user presses the button, we need to stop cardTimer
            // and then reset it.
        
            if leftIndex == rightIndex {
                scoreInt += 1
            } else {
                scoreInt -= 1
            }
            break
            
        case .ended:
            reset()
            break
        }
    }
    
    func reset() {
        gameState = .ready
        button.setTitle("Start", for: .normal)
        leftIndex = -1
        rightIndex = -1
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

