//
//  ViewController.swift
//  Animations
//
//  Created by Mike Laursen on 7/25/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerHandler), userInfo: 0, repeats: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func timerHandler(timer: Timer) {
        let index = timer.userInfo as! Int
        self.imageView.image = UIImage(named: "Image\(index + 1).png")
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerHandler), userInfo: (index + 1) % 8, repeats: false)
    }
}

