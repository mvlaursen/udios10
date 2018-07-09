//
//  ViewController.swift
//  WhereDaActionIs
//
//  Created by Mike Laursen on 7/9/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func show(_ sender: Any) {
        label.text = "Showing Options sheet."
        
        let optionMenu = UIAlertController(title: "Options", message: "My message to you is...", preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "Button 1", style: .default, handler: { (alert: UIAlertAction) in
            self.label.text = "Button 1 was tapped."
        })
        
        let action2 = UIAlertAction(title: "Button 2", style: .default, handler: { (alert: UIAlertAction) in
            self.label.text = "Button 2 was tapped."
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { (alert: UIAlertAction) -> Void in
            self.label.text = "Options sheet canceled."
        })
        
        optionMenu.addAction(action1)
        optionMenu.addAction(action2)
        optionMenu.addAction(cancel)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
}

