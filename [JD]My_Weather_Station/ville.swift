//
//  Ville.swift
//  [JD]My_Weather_Station
//
//  Created by Developer on 19/04/2015.
//  Copyright (c) 2015 Jennifer D'ROZA. All rights reserved.
//

import Foundation

class Ville {
    
    var nom: String
    var longitude: String
    var latitude: String
    
    //constructeur
    init (Nom: String , Longitude:String , Latitude : String){
        self.nom = Nom
        self.longitude = Longitude
        self.latitude = Latitude
        
        println("\(self.nom) is being created")
    }
    
}