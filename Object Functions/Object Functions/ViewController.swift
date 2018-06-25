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

    @IBAction func centerText(_ sender: Any) {
        label.textAlignment = NSTextAlignment.center
    }
    
    @IBAction func leftText(_ sender: Any) {
        label.textAlignment = NSTextAlignment.left
    }
    
    @IBAction func rightText(_ sender: Any) {
        label.textAlignment = NSTextAlignment.right
    }
    
    @IBAction func setBackground(_ sender: Any) {
        label.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func setFontSize(_ sender: Any) {
        label.font = UIFont(name: "Verdana", size: 30)
    }
    
    @IBAction func setColor(_ sender: Any) {
        label.textColor = UIColor.red
    }
    
    @IBAction func setShadow(_ sender: Any) {
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = CGSize(width: 2, height: 2)
        label.layer.shadowRadius = 2
        label.layer.shadowOpacity = 0.25
    }
    
    @IBAction func setShadowColor(_ sender: Any) {
        label.layer.shadowColor = UIColor.blue.cgColor
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

