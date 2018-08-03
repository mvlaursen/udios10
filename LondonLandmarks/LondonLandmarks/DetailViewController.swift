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
    
    public var landmark:LandmarkDataItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.barTintColor = CommonColors.LLBlue

        descriptionLabel.text = landmark.streetAddress
        
        detailTextView.text = "London, the home town of the Beatles and King Arthur, is a 21st-century city with history stretching back to caveman times. At its center stands the imposing House of Wax, the iconic ‘Big Ben’ clock tower and Westminster Abbey, site of Isaac Newton's grave. Across the River Thames, the London Eye ferris wheel provides panoramic views of all kinds of stuff."
        
        directionsButton.backgroundColor = CommonColors.LLBlue
        directionsButton.layer.cornerRadius = 2
        
        imageView.image = UIImage(named: landmark.imageName)
        
        let location = CLLocationCoordinate2D(latitude: CLLocationDegrees(51.5033), longitude: CLLocationDegrees(-0.1195))
        mapView.setCenter(location, animated: false)
        mapView.setRegion(MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: CLLocationDegrees(0.001), longitudeDelta: CLLocationDegrees(0.001))), animated: false)
        mapView.layer.cornerRadius = 2
        let annot = MKPointAnnotation()
        annot.coordinate = location
        annot.title = landmark.title
        annot.subtitle = landmark.title // TODO: Put something else here.
        mapView.addAnnotation(annot)
        
        titleLabel.text = landmark.title
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
        
        UIApplication.shared.open(URL(string: "http://maps.apple.com/maps?daddr=\(mapView.centerCoordinate.latitude),\(mapView.centerCoordinate.longitude)")!)
    }
}
