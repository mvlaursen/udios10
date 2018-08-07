//
//  ContactViewController.swift
//  LondonLandscaping
//
//  Created by Mike Laursen on 8/6/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import MapKit
import UIKit

class ContactViewController: UIViewController {
    @IBOutlet private weak var mapView: MKMapView!
    
    let LOCATION = CLLocationCoordinate2D(latitude: 51.5081, longitude: -0.0759)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        let span = MKCoordinateSpanMake(0.001, 0.001)
        let region = MKCoordinateRegion(center: LOCATION, span: span)
        mapView.setRegion(region, animated: false)
        
        let pin = MKPointAnnotation()
        pin.coordinate = LOCATION
        pin.title = "London Landscaping"
        pin.subtitle = "Hire us or we will torture you!"
        mapView.addAnnotation(pin)
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

    @IBAction func callUsAction(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "tel://555-555-1212")!)
    }
    
    @IBAction func directionsAction(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "http://maps.apple.com/maps?daddr=\(LOCATION.latitude),\(LOCATION.longitude)")!)
    }
}
