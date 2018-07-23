//
//  ViewController.swift
//  ChangingImages
//
//  Created by Mike Laursen on 7/23/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var nextButton: UIBarButtonItem!
    @IBOutlet private weak var previousButton: UIBarButtonItem!
    
    private let NUM_IMAGES: uint = 6
    
    // TODO: Can we make a limited range of ints in Swift?
    private var imageIndex: uint = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setImage(0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func next(_ sender: UIBarButtonItem) {
        if (imageIndex < NUM_IMAGES) {
            imageIndex += 1
            setImage(imageIndex)
        }
    }

    @IBAction func previous(_ sender: UIBarButtonItem) {
        if (imageIndex > 0) {
            imageIndex -= 1
            setImage(imageIndex)
        }
    }
    
    func setImage(_ index: uint) {
        imageView.image = UIImage(named: "Image1")
        
        label.text = "\(index) of \(NUM_IMAGES)"
        
        if index == 0 {
            nextButton.isEnabled = true
            previousButton.isEnabled = false
        } else if index >= NUM_IMAGES {
            nextButton.isEnabled = false
            previousButton.isEnabled = true
        } else {
            nextButton.isEnabled = true
            previousButton.isEnabled = true
        }
    }
}

