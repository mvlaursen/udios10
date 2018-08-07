//
//  EmailViewController.swift
//  LondonLandscaping
//
//  Created by Mike Laursen on 8/6/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import MessageUI
import UIKit

class EmailViewController: UIViewController, UITextViewDelegate, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var messageField: UITextView!
    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn affectedCharRange: NSRange, replacementText replacementString: String) -> Bool {
        if replacementString == "\n" {
            messageField.resignFirstResponder()
            return false
        } else if replacementString == "\t" {
            messageField.resignFirstResponder()
            nameField.becomeFirstResponder()
            return false
        }
        
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func send(_ sender: UIButton) {
        // It isn't possible to send mail on Simulator.
        if MFMailComposeViewController.canSendMail() {
            let composeVC = MFMailComposeViewController()
            composeVC.mailComposeDelegate = self
            composeVC.setToRecipients(["feedback@londonlandscaping.co.uk"])
            composeVC.setSubject("\(nameField.text ?? "No Name") -- My App")
            composeVC.setMessageBody("Name: \(nameField.text ?? "No Name") \n\nEmail:\(emailAddressField.text ?? "no@email")\n\nMessage:\(messageField.text)", isHTML: false)
            present(composeVC, animated: true, completion: nil)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        self.dismiss(animated: true, completion: nil)
    }
}
