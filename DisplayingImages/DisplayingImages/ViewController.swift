//
//  ViewController.swift
//  DisplayingImages
//
//  Created by Mike Laursen on 7/23/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showDog(_ sender: UIButton) {
        imageView.image = UIImage(named: "Dog")
    }
    
    @IBAction func onToggleImage(_ sender: UISwitch) {
        if sender.isOn {
            imageView.image = UIImage(named: "Dog")
            imageView.isHidden = false
        } else {
            imageView.image = nil
            imageView.isHidden = true
        }
    }
}

