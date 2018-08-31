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
        enableLevel2()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        enableLevel2()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func enableLevel2() {
        let locked = (UIApplication.shared.delegate as! AppDelegate).isLevel2Locked
        playLevel2Button.isEnabled = !locked
        purchaseLevel2Button.isEnabled = locked
        purchaseLevel2Button.isHidden = !locked
    }
}

