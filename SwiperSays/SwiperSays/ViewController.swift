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
    
    let DEFAULT_COUNTDOWN: Int = 20
    let MAX_SWIPE_TIME: TimeInterval = 1.5
    
    var countdown: Int = 0
    var isGameActive: Bool = false
    var score: Int = 0
    var swiperTimer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setCountdown(value: DEFAULT_COUNTDOWN)
        setScore(value: 0)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)

        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
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
        let array = ["Swiper says swipe down.", "Swipe down.", "Swiper says swipe left.", "Swipe left.", "Swiper says swipe right.", "Swipe right.", "Swiper says swipe up.", "Swipe up."]
        let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
        instructionLabel.text = array[randomIndex]
        
        swiperTimer = Timer.scheduledTimer(withTimeInterval: MAX_SWIPE_TIME, repeats: false) { (_) in
            self.simonSays()
        }
    }
    
    @objc func swipe(sender: UISwipeGestureRecognizer) {
        if isGameActive {
            if sender.direction == .down {
                swiperTimer.invalidate()
                
                if instructionLabel.text == "Swiper says swipe down." {
                    setScore(value: score + 1)
                    simonSays()
                } else {
                    setScore(value: score - 1)
                    simonSays()
                }
            }
            if sender.direction == .left {
                swiperTimer.invalidate()
                
                if instructionLabel.text == "Swiper says swipe left." {
                    setScore(value: score + 1)
                    simonSays()
                } else {
                    setScore(value: score - 1)
                    simonSays()
                }
            }
            if sender.direction == .right {
                swiperTimer.invalidate()
                
                if instructionLabel.text == "Swiper says swipe right." {
                    setScore(value: score + 1)
                    simonSays()
                } else {
                    setScore(value: score - 1)
                    simonSays()
                }
            }
            if sender.direction == .up {
                swiperTimer.invalidate()
                
                if instructionLabel.text == "Swiper says swipe up." {
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

