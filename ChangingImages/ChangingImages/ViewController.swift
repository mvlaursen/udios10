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
    
    private let IMAGE_RANGE: CountableClosedRange<Int> = 1...6
    
    // TODO: Can we make a limited range of ints in Swift?
    private var imageIndex: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setImage(1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func next(_ sender: UIBarButtonItem) {
        if (imageIndex < IMAGE_RANGE.max()!) {
            imageIndex += 1
            setImage(imageIndex)
        }
    }

    @IBAction func previous(_ sender: UIBarButtonItem) {
        if (imageIndex > IMAGE_RANGE.min()!) {
            imageIndex -= 1
            setImage(imageIndex)
        }
    }
    
    func setImage(_ index: Int) {        
        imageView.image = UIImage(named: "Image\(index)")
        
        label.text = "\(index) of \(IMAGE_RANGE.max()!)"
        
        if index <= IMAGE_RANGE.min()! {
            nextButton.isEnabled = true
            previousButton.isEnabled = false
        } else if index >= IMAGE_RANGE.max()! {
            nextButton.isEnabled = false
            previousButton.isEnabled = true
        } else {
            nextButton.isEnabled = true
            previousButton.isEnabled = true
        }
    }
}

