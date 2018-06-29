//
//  ViewController.swift
//  SwiftActions
//
//  Created by Mike Laursen on 6/28/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var segmentedLabel: UILabel!
    @IBOutlet weak var segmentedOutlet: UISegmentedControl!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var switchOutlet: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateSegmentedOutlet()
        updateSwitchOutlet()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segmentedAction(_ sender: Any) {
        updateSegmentedOutlet()
    }
    
    @IBAction func switchAction(_ sender: Any) {
        updateSwitchOutlet()
    }
    
    func updateSegmentedOutlet() {
        switch segmentedOutlet.selectedSegmentIndex {
        case 0: segmentedLabel.text = "Segment 1"
        case 1: segmentedLabel.text = "Segment 2"
        case 2: segmentedLabel.text = "Segment 3"
        case 3: segmentedLabel.text = "Segment 4"
        default: segmentedLabel.text = "Bad segment value"
        }
    }
    
    func updateSwitchOutlet() {
        if switchOutlet.isOn {
            switchLabel.text = "On-o-rooney"
        } else {
            switchLabel.text = "Off off off"
        }
    }
}

