//
//  FirstViewController.swift
//  LondonLandscaping
//
//  Created by Mike Laursen on 8/3/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet private weak var aboutButton: UIButton!
    @IBOutlet private weak var contactButton: UIButton!
    @IBOutlet private weak var portfolioButton: UIButton!
    @IBOutlet private weak var servicesButton: UIButton!
    @IBOutlet private weak var socialButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        aboutButton.setTitleColor(Colors.gardenGreen, for: .normal)
        contactButton.setTitleColor(Colors.gardenGreen, for: .normal)
        portfolioButton.setTitleColor(Colors.gardenGreen, for: .normal)
        servicesButton.setTitleColor(Colors.gardenGreen, for: .normal)
        socialButton.setTitleColor(Colors.gardenGreen, for: .normal)
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

