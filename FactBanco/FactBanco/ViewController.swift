//
//  ViewController.swift
//  FactBanco
//
//  Created by Mike Laursen on 6/28/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    let facts = ["Abraham Lincoln is dead.",
                 "A single cloud can weight more than 1 million pounds.",
                 "Coca-Cola™ would be green if coloring wasn’t added to it.",
                 "A broken clock is right two times every day.",
                 "The modern popped collar originated as a way to keep tennis players’ necks from getting sunburnt."]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.layer.cornerRadius = 20
        label.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pickRandomFact(_ sender: Any) {
        let i = Int(arc4random_uniform(UInt32(facts.count)))
        label.text = facts[i]
    }
}

