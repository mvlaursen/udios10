//
//  ViewController.swift
//  Animations
//
//  Created by Mike Laursen on 7/25/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var index: Int = 0
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (_) in
            index = (index + 1) % 8
            self.imageView.image = UIImage(named: "Image\(index + 1).png")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

