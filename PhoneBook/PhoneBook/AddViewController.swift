//
//  AddViewController.swift
//  PhoneBook
//
//  Created by Mike Laursen on 8/30/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

import CoreData
import MessageUI
import UIKit

class AddViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    @IBOutlet private weak var nameField: UITextField!
    @IBOutlet private weak var phoneNumberField: UITextField!
    
    let pc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    public var selectedContact: Contact? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if selectedContact != nil {
            nameField.text = selectedContact?.name
            phoneNumberField.text = selectedContact?.phoneNumber
            navigationItem.title = selectedContact?.name
        } else {
            navigationItem.title = "Add Contact"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction private func dismissKeyboard(_ sender: AnyObject) {
        self.resignFirstResponder()
    }

    @IBAction private func call(_ sender: UIButton) {
        if selectedContact != nil {
            let url = URL(string: "tel://" + (selectedContact?.phoneNumber)!)
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func message(_ sender: UIButton) {
        if selectedContact != nil && MFMessageComposeViewController.canSendText() {
            let messageSheet = MFMessageComposeViewController()
            messageSheet.recipients = ["\(String(selectedContact!.phoneNumber!))"]
            messageSheet.body = "Hi, there!"
            messageSheet.messageComposeDelegate = self
            present(messageSheet, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "No Can Message", message: "I can't send messages.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
        }
    }

    @IBAction private func save(_ sender: UIButton) {
        if selectedContact != nil {
            selectedContact?.name = nameField.text
            selectedContact?.phoneNumber = phoneNumberField.text
        } else {
            let contactDescription = NSEntityDescription.entity(forEntityName: "Contact", in: pc)
            let contact = Contact(entity: contactDescription!, insertInto: pc)
            contact.name = nameField.text
            contact.phoneNumber = phoneNumberField.text
        }
                
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - MFMessageComposeViewControllerDelegate methods
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        dismiss(animated: true, completion: nil)
    }
    

}
