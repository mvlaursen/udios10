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
    
    var cardTimer: Timer? = nil
    var timer: Timer? = nil
    
    var gameMode = 0
    var scoreInt = 0
    var timerInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
    }
}

