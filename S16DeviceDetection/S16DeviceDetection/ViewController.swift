//
//  ViewController.swift
//  S16DeviceDetection
//
//  Created by Mike Laursen on 9/4/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction private func whatKindOfDeviceAmI(_ sender: UIButton) {
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            label.text = "I am an iPad."
            imageView.image = UIImage(named: "ipad")
        case .phone:
            label.text = "I am an iPhone."
            imageView.image = UIImage(named: "iphone")
        default:
            break
        }
    }
}

