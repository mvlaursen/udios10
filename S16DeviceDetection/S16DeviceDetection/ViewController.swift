//
//  ViewController.swift
//  S16DeviceDetection
//
//  Created by Mike Laursen on 9/4/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var deviceImageView: UIImageView!
    @IBOutlet private weak var deviceTypeLabel: UILabel!
    @IBOutlet private weak var screenWidth: UILabel!
    @IBOutlet private weak var screenHeight: UILabel!
    
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
            deviceTypeLabel.text = "I am an iPad."
            deviceImageView.image = UIImage(named: "ipad")
        case .phone:
            deviceTypeLabel.text = "I am an iPhone."
            deviceImageView.image = UIImage(named: "iphone")
        default:
            deviceTypeLabel.text = "I am neither an iPad nor an iPhone."
            deviceImageView.image = nil
            break
        }
        
        let screenSize = UIScreen.main.bounds
        screenWidth.text = "\(Int(screenSize.width))"
        screenHeight.text = "\(Int(screenSize.height))"
        
        // iPhone 2G - 5S
        if screenSize.width == 320 {
            if screenSize.height == 480 {
                deviceTypeLabel.text = "Am I an iPhone 2G, 3G, 3GS, 4, or 4s?"
            } else if screenSize.height == 568 {
                deviceTypeLabel.text = "Am I an iPhone 5, 5s, 5c, or SE?"
            }
        } else if screenSize.width == 375 {
            if screenSize.height == 667 {
                deviceTypeLabel.text = "Am I an iPhone 6, 6s, 7, or 8?"
            } else if screenSize.height == 812 {
                deviceTypeLabel.text = "Am I an iPhone X?"
            }
        } else if screenSize.width == 414 {
            if screenSize.height == 736 {
                deviceTypeLabel.text = "Am I an iPhone 6 Plus, 6s Plus, 7 Plus, or 8 Plus?"
            }
        } else if screenSize.width == 768 {
            if screenSize.height == 1024 {
                deviceTypeLabel.text = "Am I an iPad mini, Air, or Pro 9.7\"?"
            }
        } else if screenSize.width == 834 {
            if screenSize.height == 1112 {
                deviceTypeLabel.text = "Am I an iPad Pro 10.5\"?"
            }
        } else if screenSize.width == 1024 {
            if screenSize.height == 1366 {
                deviceTypeLabel.text = "Am I an iPad Pro 12.9\"?"
            }
        }
    }
}

