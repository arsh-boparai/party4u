//
//  SecondViewController.swift
//  party4upro
//
//  Created by Nancy Sharma on 2018-07-14.
//  Copyright © 2018 Nancy Sharma. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class SecondViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var search: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var locationManager1:CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        determineMyCurrentLocation()
    }
    
    
    func determineMyCurrentLocation() {
        locationManager1 = CLLocationManager()
        locationManager1.delegate = self
        locationManager1.desiredAccuracy = kCLLocationAccuracyBest
        locationManager1.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager1.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        var poiCoodinates = CLLocationCoordinate2D()
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        // manager.stopUpdatingLocation()
        poiCoodinates.latitude = userLocation.coordinate.latitude
        poiCoodinates.longitude = userLocation.coordinate.longitude
      
        let viewRegion: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(poiCoodinates, 750, 750)
        self.mapView.setRegion(viewRegion, animated: true)
        // Plot pin
        let pin: MKPointAnnotation = MKPointAnnotation()
        pin.coordinate = poiCoodinates
        self.mapView.addAnnotation(pin)
        
        //add title to the pin
        //        pin.title = selectedLocation!.name
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
 
    @IBAction func SearchBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func nearby(_ sender: UIButton) {
        
    }
}
