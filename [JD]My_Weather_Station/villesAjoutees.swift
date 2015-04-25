//
//  villesAjoutees.swift
//  [JD]My_Weather_Station
//
//  Created by Developer on 20/04/2015.
//  Copyright (c) 2015 Jennifer D'ROZA And ArchLoy. All rights reserved.//

import Foundation


class VillesAjoutees {
    
    var listeVilles = [Ville]();
    var id = 0;
    
    func add( V:Ville){
        listeVilles.append(V);
    }
    
    func count (V:Ville) -> Int {
        return listeVilles.count;
    }
    
    func removeAt(i:Int){
        listeVilles.removeAtIndex(i)
    }
}
