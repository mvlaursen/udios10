//
//  ViewController.swift
//  Switcheroo
//
//  Created by Mike Laursen on 7/19/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchToXibView(_ sender: Any) {
        let xibView = XIBViewController(nibName: "XIBViewController", bundle: nil)
        xibView.modalTransitionStyle = .partialCurl
        self.present(xibView, animated: true, completion: nil)
    }
}

