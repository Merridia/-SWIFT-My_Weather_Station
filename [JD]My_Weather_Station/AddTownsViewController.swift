//
//  AddTownsViewController.swift
//  [JD]My_Weather_Station
//
//  Created by Developer on 13/04/2015.
//  Copyright (c) 2015 Jennifer D'ROZA And ArchLoy. All rights reserved.//

import UIKit
import MapKit


class AddTownsViewController: UIViewController {
    
    @IBOutlet weak var labelSearchTown: UILabel!
    
    @IBOutlet weak var TF_SearchTown: UITextField!
    
    @IBOutlet weak var Button_Searh: UIButton!
    
    @IBOutlet weak var labelSearchResults: UILabel!
    
    @IBOutlet weak var List_ListeTownFound: UIPickerView!
    
    @IBOutlet weak var button_SaveThisTown: UIButton!
    
    
    @IBAction func button_SaveThisTown(sender: AnyObject) {
        
        var ajoutVille : VillesAjoutees
        ajoutVille = VillesAjoutees()
        
        //var city = Ville(Nom: SeachTown.text , Longitude: TFTownLong.text , Latitude: TFTownLat.text )
        
        
        //ajoutVille.add(city)
        
    }
    
    //Recherche la ville dans l'api openweather
    @IBAction func actionSearch(sender: AnyObject) {
        
        //TF_SearchTown.text
        
        //s'il trouve plusieur ville, il rempli la liste suivante:
        //List_ListeTownFound
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
