//
//  ViewController.swift
//  SnapAttack
//
//  Created by Mike Laursen on 7/24/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var button: UIButton!
    @IBOutlet private weak var leftCard: UIImageView!
    @IBOutlet private weak var rightCard: UIImageView!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    
    private let CARD_LIST = ["2_of_hearts", "7_of_hearts", "jack_of_hearts2", "queen_of_hearts2", "king_of_hearts2", "ace_of_hearts"]
    private let COUNTDOWN_START = 60
    private let FACE_DOWN_TIME = 0.2
    private let REACTION_TIME = 0.75
    
    private enum GameState {
    case start, cardsHidden, cardsShowing, end
    }
    
    private var cardTimer: Timer? = nil
    private var countdown = 0
    private var gameState = GameState.start
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
        case .start:
            enableButton(false)
            button.setTitle("Slap", for: .normal)
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (countdownTimer) in
                self.countdown -= 1
                self.updateScoreboard()
            
                if self.countdown == 0 {
                    countdownTimer.invalidate()
                    self.stopCardTimer()
                    self.enableButton(true)
                    self.button.setTitle("Reset", for: .normal)
                    self.gameState = .end
                } else if self.cardTimer == nil {
                    self.startCardTimer()
                }
            })

            startCardTimer()
            break

        case .cardsHidden:
            break
            
        case .cardsShowing:
            stopCardTimer()
            enableButton(false)
            if leftIndex == rightIndex {
                AudioServicesPlaySystemSound(SystemSoundID(1115)) // "JBL_Ambiguous"
                scoreInt += 1
                updateScoreboard()
            } else {
                AudioServicesPlaySystemSound(SystemSoundID(1053)) // "SIMToolkitNegativeACK"
                scoreInt -= 1
                updateScoreboard()
            }
            break
        
        case .end:
            reset()
            break
        }
    }
    
    func enableButton(_ enabled: Bool) {
        button.isEnabled = enabled
        if button.isEnabled {
            button.alpha = 1.0
        } else {
            button.alpha = 0.75
        }
    }
    
    func reset() {
        enableButton(true)
        button.setTitle("Start", for: .normal)
        leftIndex = -1
        rightIndex = -1
        leftCard.image = UIImage(named: "blue_cover")
        rightCard.image = UIImage(named: "red_cover")
        scoreInt = 0
        countdown = COUNTDOWN_START
        updateScoreboard()
        gameState = .start
    }
    
    func startCardTimer() {
        gameState = .cardsHidden
        enableButton(false)
        // TODO: Would be cool to randomly alternate blue and red.
        leftCard.image = UIImage(named: "blue_cover")
        rightCard.image = UIImage(named: "red_cover")

        cardTimer = Timer.scheduledTimer(withTimeInterval: FACE_DOWN_TIME, repeats: false, block: { (_) in
            self.leftIndex = Int(arc4random_uniform(UInt32(self.CARD_LIST.count)))
            self.rightIndex = Int(arc4random_uniform(UInt32(self.CARD_LIST.count)))
            self.leftCard.image = UIImage(named: self.CARD_LIST[self.leftIndex])
            self.rightCard.image = UIImage(named: self.CARD_LIST[self.rightIndex])
            self.enableButton(true)
            self.cardTimer = nil

            self.cardTimer = Timer.scheduledTimer(withTimeInterval: self.REACTION_TIME, repeats: false, block: { (_) in
                self.stopCardTimer()
            })
            
            self.gameState = .cardsShowing
        })
    }
    
    func stopCardTimer() {
        if cardTimer != nil {
            cardTimer!.invalidate()
        }
        cardTimer = nil
    }
    
    func updateScoreboard() {
        scoreLabel.text = String("Score: \(scoreInt)")
        timeLabel.text = String("Time: \(countdown)")
    }
}

