//
//  ViewController.swift
//  ThisIsAnAlert
//
//  Created by Mike Laursen on 7/11/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func alertMe(_ sender: Any) {
        let alert = UIAlertController(title: "Important", message: "This is really important.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { (_) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

