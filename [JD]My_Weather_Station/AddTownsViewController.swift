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
    
    var listreturn = [Ville]()
    var items = [String]()
    
    @IBAction func button_SaveThisTown(sender: AnyObject) {
        
    }
    //https://www.youtube.com/watch?v=MdXmIViD17U
    
    
    //Recherche la ville dans l'api openweather
    @IBAction func actionSearch(sender: AnyObject) {
        
        if TF_SearchTown.text != "" {
            listreturn = getCity.getResults(TF_SearchTown.text)
            //listreturn.count
            for m_city in listreturn {
                var nomVille = m_city.getName()
                var nomCnty = m_city.getCntry()
                var strAffichée = nomVille + ", " + nomCnty
                items.append(strAffichée)
            }
        }
    }

        func numberOfComponentsInPickerView(pikerView: UIPickerView!) -> Int{
            return villes.count
        }
        
        func numberOfRowsInComponent(_component: Int) -> Int{
            return items.count
        }
        
        func pickerView(_pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!{
            return items[row]
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listreturn.append(city)

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
