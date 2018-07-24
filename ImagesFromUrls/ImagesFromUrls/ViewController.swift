//
//  ViewController.swift
//  ImagesFromUrls
//
//  Created by Mike Laursen on 7/23/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let imageUrl = URL(string: "http://laursen.org/200903SanFranciscoZoo/content/bin/images/large/20090307_IMG_1520.jpg")
        let data = try? Data(contentsOf: imageUrl!)
        if data != nil {
            imageView.image = UIImage(data: data!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

