//
//  ViewController.swift
//  SwiftActions
//
//  Created by Mike Laursen on 6/28/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var switchOutlet: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateSwitchOutlet()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchAction(_ sender: Any) {
        updateSwitchOutlet()
    }
    
    func updateSwitchOutlet() {
        if switchOutlet.isOn {
            switchLabel.text = "On-o-rooney"
        } else {
            switchLabel.text = "Off off off"
        }
    }
}

