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
    
    private let IMAGE_INDEX_RANGE: CountableClosedRange<Int> = 1...6
    
    // TODO: Can we make a limited range of ints in Swift?
    private var imageIndex: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func next(_ sender: UIBarButtonItem) {
        if (imageIndex < IMAGE_INDEX_RANGE.max()!) {
            imageIndex += 1
            updateImage()
        }
    }

    @IBAction func previous(_ sender: UIBarButtonItem) {
        if (imageIndex > IMAGE_INDEX_RANGE.min()!) {
            imageIndex -= 1
            updateImage()
        }
    }
    
    func updateImage() {
        assert(IMAGE_INDEX_RANGE.contains(imageIndex))
        if (imageIndex < IMAGE_INDEX_RANGE.min()!) {
            imageIndex = IMAGE_INDEX_RANGE.min()!
        }
        if (imageIndex > IMAGE_INDEX_RANGE.max()!) {
            imageIndex = IMAGE_INDEX_RANGE.max()!
        }
 
        imageView.image = UIImage(named: "Image\(imageIndex)")
        
        label.text = "\(imageIndex) of \(IMAGE_INDEX_RANGE.max()!)"
        
        if imageIndex <= IMAGE_INDEX_RANGE.min()! {
            nextButton.isEnabled = true
            previousButton.isEnabled = false
        } else if imageIndex >= IMAGE_INDEX_RANGE.max()! {
            nextButton.isEnabled = false
            previousButton.isEnabled = true
        } else {
            nextButton.isEnabled = true
            previousButton.isEnabled = true
        }
    }
}

