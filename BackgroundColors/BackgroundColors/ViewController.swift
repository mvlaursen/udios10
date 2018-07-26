//
//  ViewController.swift
//  BackgroundColors
//
//  Created by Mike Laursen on 7/25/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var blueSlider: UISlider!
    @IBOutlet private weak var redSlider: UISlider!
    @IBOutlet private weak var greenSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func blueSlider(_ sender: UISlider) {
        self.view.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1.0)
    }
    
    @IBAction func customButton(_ sender: UIButton) {
        self.view.backgroundColor = UIColor(red: 188/255, green: 188/255, blue: 0, alpha: 1.0)
    }
    
    @IBAction func pinkButton(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.magenta
    }
    
    @IBAction func greenButton(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.green
    }
    
    @IBAction func greenSlider(_ sender: UISlider) {
        self.view.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1.0)
    }
    
    @IBAction func redButton(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.red
    }
    
    @IBAction func redSlider(_ sender: UISlider) {
         self.view.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1.0)
    }
    
    @IBAction func yellowButton(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.yellow
    }
}

