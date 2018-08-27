//
//  AddViewController.swift
//  PhotoBase
//
//  Created by Mike Laursen on 8/23/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet private weak var descriptionTextField: UITextField!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    }
    
    @IBAction private func onCameraTapped(_ sender: UIButton) {
    }
    
    @IBAction private func onLibraryTapped(_ sender: UIButton) {
    }
    
    @IBAction private func savePhoto(_ sender: UIButton) {
    }
}
