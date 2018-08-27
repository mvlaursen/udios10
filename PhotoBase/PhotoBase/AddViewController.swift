//
//  AddViewController.swift
//  PhotoBase
//
//  Created by Mike Laursen on 8/23/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import CoreData
import UIKit

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet private weak var descriptionTextField: UITextField!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleTextField: UITextField!
    
    let pc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var item: Entity? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if item != nil {
            descriptionTextField.text = item?.descr
            imageView.image = UIImage(data: (item?.image)! as Data)
            titleTextField.text = item?.title
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

    // MARK: - Actions
    
    @IBAction private func dismissKeyboard(_ sender: UITextField) {
        self.resignFirstResponder()
    }
    
    @IBAction private func onCameraTapped(_ sender: UIButton) {
        let pickerController = UIImagePickerController()
        pickerController.allowsEditing = true
        pickerController.delegate = self
        pickerController.sourceType = .camera
        
        self.present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction private func onLibraryTapped(_ sender: UIButton) {
        let pickerController = UIImagePickerController()
        pickerController.allowsEditing = true
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        
        self.present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction private func savePhoto(_ sender: UIButton) {
        if item != nil {
            item?.descr = descriptionTextField.text
            item?.image = UIImagePNGRepresentation(imageView.image!) as NSData?
            item?.title = titleTextField.text
        } else {
            let entityDescription = NSEntityDescription.entity(forEntityName: "Entity", in: pc)
            item = Entity(entity: entityDescription!, insertInto: pc)
            item?.descr = descriptionTextField.text
            item?.image = UIImagePNGRepresentation(imageView.image!) as NSData?
            item?.title = titleTextField.text
        }
        
        do {
            try pc.save()
        } catch {
            print(error)
            return
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - ImagePickerController methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}
