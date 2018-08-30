//
//  AddViewController.swift
//  PhoneBook
//
//  Created by Mike Laursen on 8/30/18.
//  Copyright © 2018 Appamajigger. All rights reserved.
//

import CoreData
import UIKit

class AddViewController: UIViewController {
    @IBOutlet private weak var nameField: UITextField!
    @IBOutlet private weak var phoneNumberField: UITextField!
    
    let pc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    public var contactToEdit: Contact? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if contactToEdit != nil {
            nameField.text = contactToEdit?.name
            phoneNumberField.text = contactToEdit?.phoneNumber
            navigationItem.title = contactToEdit?.name
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

    @IBAction private func save(_ sender: UIButton) {
        if contactToEdit != nil {
            contactToEdit?.name = nameField.text
            contactToEdit?.phoneNumber = phoneNumberField.text
        } else {
            let contactDescription = NSEntityDescription.entity(forEntityName: "Contact", in: pc)
            let contact = Contact(entity: contactDescription!, insertInto: pc)
            contact.name = nameField.text
            contact.phoneNumber = phoneNumberField.text
        }
        
        do {
            try pc.save()
        } catch {
            print(error)
            return
        }
        navigationController?.popViewController(animated: true)
    }
}
