//
//  ViewController.swift
//  SocialSharing
//
//  Created by Mike Laursen on 8/28/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import MessageUI
import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction private func sendMessage(_ sender: UIButton) {
        if MFMessageComposeViewController.canSendText() {
            let messageSheet = MFMessageComposeViewController()
            let imageData = UIImageJPEGRepresentation(imageView.image!, 1.0)
            messageSheet.addAttachmentData(imageData!, typeIdentifier: "image/jpg", filename: "image.jpg")
            messageSheet.body = label.text
            present(messageSheet, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Warning", message: "Device cannot send messages.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction private func share(_ sender: UIButton) {
        let activityViewController = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
}

