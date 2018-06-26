//
//  ViewController.swift
//  FadingObjects
//
//  Created by Mike Laursen on 6/26/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var switchControl: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func disable(_ sender: Any) {
        button.isEnabled = false
        segmentedControl.isEnabled = false
        switchControl.isEnabled = false
    }
    
    @IBAction func enable(_ sender: Any) {
        button.isEnabled = true
        segmentedControl.isEnabled = true
        switchControl.isEnabled = true
    }
    
    @IBAction func amIDisabled(_ sender: Any) {
        if button.isEnabled {
            label4.text = "No"
        } else {
            label4.text = "Yes"
        }
    }
    
    @IBAction func amIHidden(_ sender: Any) {
        if label2.isHidden {
            label3.text = "Yes"
        } else {
            label3.text = "No"
        }
    }
    
    @IBAction func hide(_ sender: Any) {
        label2.isHidden = true
    }
    
    @IBAction func reveal(_ sender: Any) {
        label2.isHidden = false
    }
    
    @IBAction func fadeIn(_ sender: Any) {
        UIView.animate(withDuration: 1.2, animations: {
            self.label.alpha = 1
            self.slider.value = 1
        })
    }
    
    @IBAction func fadeOut(_ sender: Any) {
        UIView.animate(withDuration: 1.2, animations: {
            self.label.alpha = 0
            self.slider.value = 0
        })
    }
    
    @IBAction func alphaSliderAction(_ sender: Any) {
        label.alpha = CGFloat(slider.value)
    }
}

