//
//  Geolocations.swift
//  [JD]My_Weather_Station
//
//  Created by Developer on 20/04/2015.
//  Copyright (c) 2015 Jennifer D'ROZA. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

var locationManager:CLLocationManager = CLLocationManager()

func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
    
    let location = locations.last as CLLocation
    
    println("didUpdateLocations:  (location.coordinate.latitude), (location.coordinate.longitude)")
    
}

class CoreLocationController : NSObject, CLLocationManagerDelegate {
    
    var locationManager:CLLocationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
    }
    
    class GetMarkLocation{

    let geocoder = CLGeocoder()
   }

}

