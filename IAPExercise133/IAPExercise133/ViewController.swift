//
//  ViewController.swift
//  IAPExercise133
//
//  Created by Mike Laursen on 8/30/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var playLevel2Button: UIButton!
    @IBOutlet private weak var purchaseLevel2Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reset(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "Level2Locked")
        userDefaults.synchronize()
    }
    
    // MARK: - Utility

    private func updateView() {
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        appDelegate.makeProductsRequest()
        playLevel2Button.isEnabled = !appDelegate.isLevel2Locked
        purchaseLevel2Button.isEnabled = appDelegate.isLevel2Locked
        purchaseLevel2Button.isHidden = !appDelegate.isLevel2Locked
    }
}

