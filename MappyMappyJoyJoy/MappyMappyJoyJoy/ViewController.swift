//
//  ViewController.swift
//  MappyMappyJoyJoy
//
//  Created by Mike Laursen on 7/20/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chooseMapType(_ sender: UISegmentedControl) {
        if segmentControl.selectedSegmentIndex == 0 {
            mapView.mapType = .standard
        } else if segmentControl.selectedSegmentIndex == 1 {
            mapView.mapType = .satellite
        } else {
            mapView.mapType = .hybrid
        }
    }
    
    @IBAction func directionsAction(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func locateMe(_ sender: UIBarButtonItem) {
    }
}

