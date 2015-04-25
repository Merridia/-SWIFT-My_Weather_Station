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


let locManager = CLLocationManager()

class Locate
{
    init()
    {
        if(CLLocationManager.locationServicesEnabled())
        {
            locManager.requestAlwaysAuthorization()
        }
        locManager.startUpdatingLocation()
    }
    
    func getLoc() -> CLLocation!
    {
        
        if( CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse || CLLocationManager.authorizationStatus() == CLAuthorizationStatus.Authorized)
        {
                
            return locManager.location
                
        }
        
        return nil
    }
    
    func getLat() -> String
    {
        var ll = getLoc()
        if(ll != nil)
        {
            return ll.coordinate.latitude.description
        }
        
        return ""
    }
    func getLon() -> String
    {
        var ll = getLoc()
        if(ll != nil)
        {
            return ll.coordinate.longitude.description
        }
        
        return ""
    }
    
    
}

func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
    
    let location = locations.last as CLLocation
    
    println("didUpdateLocations:  (location.coordinate.latitude), (location.coordinate.longitude)")
    
}

class CoreLocationController : NSObject, CLLocationManagerDelegate {
    
    var locationManager:CLLocationManager = CLLocationManager()
    
    override init()
    {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
    }
    
    class GetMarkLocation{

    let geocoder = CLGeocoder()
   }

}

