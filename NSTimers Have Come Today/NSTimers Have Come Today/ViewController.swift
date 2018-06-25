//
//  ViewController.swift
//  NSTimers Have Come Today
//
//  Created by Mike Laursen on 6/25/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var counter:Int = 0
    var timer:Timer = Timer()
    var timer2:Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        timer.invalidate()
        counter = 0;
    }
    
    @IBAction func start(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        counter += 1
        label.text = String(counter)
    }
    
    @objc func updateTimer() {
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
    
        dateFormatter.dateStyle = .medium
        timeFormatter.timeStyle = .medium
        
        dateLabel.text = dateFormatter.string(from: NSDate() as Date)
        timeLabel.text = timeFormatter.string(from: NSDate() as Date)
        
    }
    
    @IBAction func stop(_ sender: Any) {
        timer.invalidate()
    }
}

