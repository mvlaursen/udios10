//
//  ViewController.swift
//  DigitalClock
//
//  Created by Mike Laursen on 6/29/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .medium
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
                self.label.text = timeFormatter.string(from: Date())
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

