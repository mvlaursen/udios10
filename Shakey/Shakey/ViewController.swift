//
//  ViewController.swift
//  Shakey
//
//  Created by Mike Laursen on 7/9/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    var timer: Timer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = "Shake me."
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            if timer != nil {
                timer!.invalidate()
                timer = nil
            }
            
            label.text = "I'm all shook up."

            timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { (timer) in
                self.label.text = "Shake me, again."
                self.timer = nil
            })
        }
    }
}

