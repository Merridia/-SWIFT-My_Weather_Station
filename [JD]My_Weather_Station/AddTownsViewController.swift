//
//  AddTownsViewController.swift
//  [JD]My_Weather_Station
//
//  Created by Developer on 13/04/2015.
//  Copyright (c) 2015 Jennifer D'ROZA And ArchLoy. All rights reserved.//

import UIKit
import MapKit


class AddTownsViewController: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet weak var labelSearchTown: UILabel!
    
    @IBOutlet weak var TF_SearchTown: UITextField!
    
    @IBOutlet weak var Button_Searh: UIButton!
    
    @IBOutlet weak var labelSearchResults: UILabel!
    
    @IBOutlet weak var List_ListeTownFound: UIPickerView!
    
    @IBOutlet weak var button_SaveThisTown: UIButton!
    
    
    //https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/CollectionTypes.html
    var villes: [String] = ["Paris","Bordeaux"]
    var city = Ville(m_nom: "Paris", m_longitude:"2.3488000", m_latitude:"48.8534100")
    var v = "Marseille"
    //https://www.youtube.com/watch?v=MdXmIViD17U
    
    
    @IBAction func button_SaveThisTown(sender: AnyObject) {
        
        var ajoutVille : VillesAjoutees
        ajoutVille = VillesAjoutees()
    }
    
        func numberOfComponentsInPickerView(pikerView: UIPickerView!) -> Int{
            return villes.count
        }
        
        func numberOfRowsInComponent(_component: Int) -> Int{
            villes.append(v)
            return villes.count
        }
        
        func pickerView(_pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!{
            return villes[row]
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
