//
//  FirstViewController.swift
//  LondonLandscaping
//
//  Created by Mike Laursen on 8/3/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        // TODO: Set buttons text color to gardenGreen programmatically.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.accessibilityIdentifier != nil {
            switch sender.accessibilityIdentifier! {
            case "services": tabBarController?.selectedIndex = 1
            case "portfolio": tabBarController?.selectedIndex = 2
            case "contact": tabBarController?.selectedIndex = 3
            case "about": tabBarController?.selectedIndex = 4
            case "social": break
            default: break
            }
        }
    }
}

