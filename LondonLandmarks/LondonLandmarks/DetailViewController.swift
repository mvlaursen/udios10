//
//  DetailViewController.swift
//  LondonLandmarks
//
//  Created by Mike Laursen on 8/2/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import MapKit
import UIKit

class DetailViewController: UIViewController {
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var detailTextView: UITextView!
    @IBOutlet private weak var directionsButton: UIButton!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    public var landmarkDescription:String!
    public var landmarkImageName:String!
    public var landmarkTitle:String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.barTintColor = CommonColors.LLBlue

        descriptionLabel.text = landmarkDescription
        
        directionsButton.backgroundColor = CommonColors.LLBlue
        directionsButton.layer.cornerRadius = 2
        
        imageView.image = UIImage(named: landmarkImageName)
        
        mapView.layer.cornerRadius = 2
        
        titleLabel.text = landmarkTitle
        titleLabel.textColor = CommonColors.LLBlue
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

    @IBAction private func directionsAction(_ sender: UIButton) {
    }
}
