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
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

