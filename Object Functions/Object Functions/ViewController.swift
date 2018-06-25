//
//  ViewController.swift
//  Object Functions
//
//  Created by Mike Laursen on 6/24/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dismissKeyboard(_ sender: Any) {
        self.resignFirstResponder()
    }

    @IBAction func setText(_ sender: Any) {
        label.text = "I am in the label!"
        
        textView.text = textField.text
    }
    
    // UITextViewDelegate
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        
        return true
    }
}

