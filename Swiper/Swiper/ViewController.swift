//
//  ViewController.swift
//  Swiper
//
//  Created by Mike Laursen on 7/10/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    var timer: Timer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(sender:)))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(sender:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(sender:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(sender:)))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        resetLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func resetLabel() {
        label.text = "Swipe me!"
    }
    
    @objc func swipeGesture(sender: UISwipeGestureRecognizer) {
        var directionAsString: String! = "uninitialized"
        
        switch sender.direction {
        case .down: directionAsString = "down"
        case .left: directionAsString = "left"
        case .right: directionAsString = "right"
        case .up: directionAsString = "up"
        default: directionAsString = "error"
        }
        
        label.text = "Swiper, no swiping \(directionAsString!)!"
        
        if timer != nil {
            timer!.invalidate()
            timer = nil
        }
        timer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(resetLabel), userInfo: nil, repeats: false)
    }
}

