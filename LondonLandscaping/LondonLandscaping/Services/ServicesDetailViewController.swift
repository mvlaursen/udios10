//
//  ServicesDetailViewController.swift
//  LondonLandscaping
//
//  Created by Mike Laursen on 8/3/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import UIKit

class ServicesDetailViewController: UIViewController {
    @IBOutlet private weak var serviceBlurbText: UITextView!
    @IBOutlet private weak var serviceTitleLabel: UILabel!
    @IBOutlet private weak var serviceImageView: UIImageView!
    
    public var serviceBlurb: String!
    public var serviceImageName: String!
    public var serviceTitle: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        serviceBlurbText.text = serviceBlurb
        serviceImageView.image = UIImage(named: serviceImageName)
        serviceTitleLabel.textColor = Colors.gardenGreen
        serviceTitleLabel.text = serviceTitle
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

}
