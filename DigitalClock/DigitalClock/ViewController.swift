//
//  ViewController.swift
//  DigitalClock
//
//  Created by Mike Laursen on 6/29/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var backgroundColorSegmented: UISegmentedControl!
    @IBOutlet weak var clockLabel: UILabel!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var textColorSegmented: UISegmentedControl!
    
    let SETTINGS_ALPHA_BRIGHT: CGFloat = 0.75
    let SETTINGS_ALPHA_DIM: CGFloat = 0.25
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        settingsButton.layer.cornerRadius = 5
        settingsView.isHidden = true
        settingsView.layer.cornerRadius = 5
        updateSettingsButtonLook()
        
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .medium
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
                self.clockLabel.text = timeFormatter.string(from: Date())
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectBackgroundColor(_ sender: Any) {
        switch backgroundColorSegmented.selectedSegmentIndex {
        case 0: self.view.backgroundColor = UIColor.black
        case 1: self.view.backgroundColor = UIColor.white
        case 2: self.view.backgroundColor = UIColor.yellow
        case 3: self.view.backgroundColor = UIColor.blue
        default: break
        }
    }
    
    @IBAction func selectTextColor(_ sender: Any) {
        switch textColorSegmented.selectedSegmentIndex {
        case 0: clockLabel.textColor = UIColor.white
        case 1: clockLabel.textColor = UIColor.black
        case 2: clockLabel.textColor = UIColor.red
        case 3: clockLabel.textColor = UIColor.green
        default: break
        }
    }
    
    @IBAction func toggleSettings(_ sender: Any) {
        settingsView.isHidden = !settingsView.isHidden
        updateSettingsButtonLook()
    }
    
    func updateSettingsButtonLook() {
        if settingsView.isHidden {
            settingsButton.alpha = SETTINGS_ALPHA_DIM
            settingsButton.setTitle("Show Settings", for: .normal)
        } else {
            settingsButton.alpha = SETTINGS_ALPHA_BRIGHT
            settingsButton.setTitle("Hide Settings", for: .normal)

        }
    }
}

