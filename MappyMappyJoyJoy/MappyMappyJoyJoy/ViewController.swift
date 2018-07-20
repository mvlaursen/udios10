//
//  ViewController.swift
//  MappyMappyJoyJoy
//
//  Created by Mike Laursen on 7/20/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import CoreLocation
import MapKit
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mapTypeChooser: UISegmentedControl!
    @IBOutlet weak var mapView: MKMapView!
    
    let DEFAULT_LOCATION = CLLocationCoordinate2D(latitude: CLLocationDegrees(37.389859), longitude: CLLocationDegrees(-122.082198))
    let locationManager = CLLocationManager()
    var location = CLLocationCoordinate2D()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = DEFAULT_LOCATION
        annotation.title = "Mountain View City Hall"
        annotation.subtitle = "500 Castro Street"
        mapView.addAnnotation(annotation)

        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegion(center: DEFAULT_LOCATION, span: span)
        mapView.setRegion(region, animated: true)        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chooseMapType(_ sender: UISegmentedControl) {
        switch mapTypeChooser.selectedSegmentIndex {
        case 0: mapView.mapType = .standard
        case 1: mapView.mapType = .satellite
        case 2: mapView.mapType = .hybrid
        default: do {
            mapView.mapType = .standard
            assert(false)
            }
        }
    }
    
    @IBAction func directionsAction(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func locateMe(_ sender: UIBarButtonItem) {
    }
}

