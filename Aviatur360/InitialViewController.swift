//
//  InitialViewController.swift
//  Aviatur360
//
//  Created by Alejandro Rodriguez on 1/31/17.
//  Copyright © 2017 Alejandro Rodriguez. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

class InitialViewController: UIViewController {
    
    var locationManager: CLLocationManager!
    
    var location:CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeLocationManager()
       
    }
    
    func initializeLocationManager(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
        }
    }
    
    
    
    @IBAction func didPressIngresar(_ sender: Any) {
     
        let listVC = ListViewController()
        present(UINavigationController(rootViewController: listVC), animated: true, completion: nil)
    }
}

extension InitialViewController: CLLocationManagerDelegate{
 
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            break
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if location == nil{
            location = locations[0]
            manager.stopUpdatingLocation()
            
            let geoCoder = GMSGeocoder()
            
            
            geoCoder.reverseGeocodeCoordinate(location!.coordinate, completionHandler: { (response, error) in
                if let _ = response{
                    
                    /*
                     Ciudad
                     print(r.firstResult()!.locality )
                     Barrio
                     print(r.firstResult()!.subLocality)
                     */
                }
            })
        }
    }

    
}
