//
//  ViewController.swift
//  ClassDemo6
//
//  Created by Joe Miller on 7/20/22.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var zoomSlider: UISlider!
    
    var multiplier:Double = 0.0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView.delegate = self
        mapView.showsUserLocation = true
        multiplier = 0.5
        
    }

    @IBAction func zoomIn(_ sender: Any) {
        let userLocation = mapView.userLocation
        
        let center = userLocation.location!.coordinate          // put user at center of map
        let ratio = view.bounds.height / view.bounds.width
        let NSdistance = 2000.0 * ratio * (multiplier * 10)    // meters
        let EWdistance = 2000.0                                 // meters
        
        let region = MKCoordinateRegion(center: center, latitudinalMeters: NSdistance, longitudinalMeters: EWdistance)
        
        // commit the region
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func changeMapType(_ sender: Any) {
        switch mapView.mapType {
        case .standard:
            mapView.mapType = .satellite
        case .satellite:
            mapView.mapType = .hybrid
        case .hybrid:
            mapView.mapType = .standard
        default:
            print("This shouldn't happen")
            
        }
    }
    @IBAction func sliderChanged(_ sender: Any) {
        
        multiplier = Double(zoomSlider.value)
        zoomIn(self)
        print(multiplier)
    }
    
}

