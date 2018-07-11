//
//  ViewController.swift
//  SwiperSays
//
//  Created by Mike Laursen on 7/10/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var startGameButton: UIButton!
    
    class SwipeInfo {
        var badInstruction: String = String()
        var direction: UISwipeGestureRecognizerDirection = .left
        var goodInstruction: String = String()
        var recognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
        
        init(direction: UISwipeGestureRecognizerDirection, goodInstruction: String, badInstruction: String,
             recognizer: UISwipeGestureRecognizer) {
            self.badInstruction = badInstruction
            self.direction = direction
            self.goodInstruction = goodInstruction
            self.recognizer = recognizer
            self.recognizer.direction = direction
        }
    }
    
    let DEFAULT_COUNTDOWN: Int = 20
    let MAX_SWIPE_TIME: TimeInterval = 3
    
    var countdown: Int = 0
    var instruction: Array<String> = []
    var isGameActive: Bool = false
    var score: Int = 0
    var swipeInfo: Array<SwipeInfo> = []
    var swiperTimer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setCountdown(value: DEFAULT_COUNTDOWN)
        setScore(value: 0)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeInfo.append(SwipeInfo(direction: .down, goodInstruction: "Swiper says swipe down.",
            badInstruction: "Swipe down.", recognizer: swipeDown))

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeInfo.append(SwipeInfo(direction: .left, goodInstruction: "Swiper says swipe left.",
            badInstruction: "Swipe left.", recognizer: swipeLeft))

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeInfo.append(SwipeInfo(direction: .right, goodInstruction: "Swiper says swipe right.",
            badInstruction: "Swipe right.", recognizer: swipeRight))

        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeInfo.append(SwipeInfo(direction: .up, goodInstruction: "Swiper says swipe up.",
            badInstruction: "Swipe up.", recognizer: swipeUp))
        
        for info in swipeInfo {
            self.view.addGestureRecognizer(info.recognizer)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startGame(_ sender: UIButton) {
        if countdown == DEFAULT_COUNTDOWN {
            isGameActive = true
            startGameButton.isEnabled = false
            startGameButton.alpha = 0.25
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
                self.setCountdown(value: self.countdown - 1)
                if self.countdown == 0 {
                    timer.invalidate()
                    
                    self.startGameButton.isEnabled = true
                    self.startGameButton.alpha = 1
                    self.startGameButton.setTitle("Restart", for: .normal)
                    
                    self.isGameActive = false
                }
            }
            
            simonSays()
        }
        
        if countdown == 0 {
            instructionLabel.text = "Ready?"
            setCountdown(value: DEFAULT_COUNTDOWN)
            setScore(value: 0)
            startGameButton.setTitle("Start Game", for: .normal)
         }
    }
    
    func setCountdown(value: Int) {
        countdown = value
        countdownLabel.text = String("Time: \(value)")
    }
    
    func setScore(value: Int) {
        score = value
        scoreLabel.text = String("Score: \(value)")
    }
    
    func simonSays() {
        let swipeInfo: SwipeInfo = self.swipeInfo[Int(arc4random_uniform(UInt32(self.swipeInfo.count)))]
        let badOrGood: Int = Int(arc4random_uniform(2))
        if badOrGood == 0 {
            instructionLabel.text = swipeInfo.badInstruction
        } else {
            instructionLabel.text = swipeInfo.goodInstruction
        }
        
        swiperTimer = Timer.scheduledTimer(withTimeInterval: MAX_SWIPE_TIME, repeats: false) { (_) in
            if self.isGameActive {
                self.simonSays()
            }
        }
    }
    
    @objc func swipe(sender: UISwipeGestureRecognizer) {
        if isGameActive {
            swiperTimer.invalidate()
            
            let infoFiltered = swipeInfo.filter { (info) -> Bool in
                sender.direction == info.direction
            }
            assert(infoFiltered.count == 1)
            if (infoFiltered.count == 1) {
                if instructionLabel.text == infoFiltered[0].goodInstruction {
                    setScore(value: score + 1)
                    simonSays()
                } else {
                    setScore(value: score - 1)
                    simonSays()
                }
            }
        }
    }
}

