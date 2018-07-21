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

class ViewController: UIViewController, CLLocationManagerDelegate {
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
        setLocation(location: DEFAULT_LOCATION)
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
        let destinationUrl = URL(string: "http://maps.apple.com/map?daddr=\(DEFAULT_LOCATION.latitude),\(DEFAULT_LOCATION.longitude)")
        UIApplication.shared.open(destinationUrl!, options: [:], completionHandler: nil)
    }
    
    @IBAction func locateMe(_ sender: UIBarButtonItem) {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
    }
    
    // CLLocationManager delegate methods
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations[0] as CLLocation
        
        locationManager.stopUpdatingLocation()
        let location = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        setLocation(location: location)
        
    }
    
    // Utility methods
    
    func setLocation(location: CLLocationCoordinate2D) {
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
}

