//
//  AddTownsViewController.swift
//  [JD]My_Weather_Station
//
//  Created by Developer on 13/04/2015.
//  Copyright (c) 2015 Jennifer D'ROZA And ArchLoy. All rights reserved.//

import UIKit
import MapKit


class AddTownsViewController: UIViewController {
    
    @IBOutlet weak var MVMapViewAddTown: MKMapView!
    
    @IBOutlet weak var SeachTown: UISearchBar!
    
    @IBOutlet weak var ButtonTownSave: UIButton!
    
    @IBAction func SaveTown(sender: AnyObject) {
        
        var ajoutVille : VillesAjoutees
        ajoutVille = VillesAjoutees()
        
        //var city = Ville(Nom: SeachTown.text , Longitude: TFTownLong.text , Latitude: TFTownLat.text )
        
        
        //ajoutVille.add(city)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
