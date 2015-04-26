//
//  AddTownsViewController.swift
//  [JD]My_Weather_Station
//
//  Created by Developer on 13/04/2015.
//  Copyright (c) 2015 Jennifer D'ROZA And ArchLoy. All rights reserved.//

import UIKit
import MapKit

var items = [Ville]()
var townToAdd = Ville(m_nom: "Vladivostok", m_longitude: "131.89999", m_latitude: "43.13333")
var selectedItem = Ville(m_nom: "Vladivostok", m_longitude: "131.89999", m_latitude: "43.13333")


class piker: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    let ElementCount: Int!
    
    init(pickerInterval: Int) {
        ElementCount = pickerInterval
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return items[row].getName() + ", " + items[row].getCntry()
    }
    
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int)
    {
        selectedItem = items[row]
    }

    func getSel() -> Ville
    {
        return selectedItem
    }
}

class AddTownsViewController: UIViewController{
    
    @IBOutlet weak var labelSearchTown: UILabel!
    
    @IBOutlet weak var TF_SearchTown: UITextField!
    
    @IBOutlet weak var Button_Searh: UIButton!
    
    @IBOutlet weak var labelSearchResults: UILabel!
    
    @IBOutlet weak var List_ListeTownFound: UIPickerView!
    
    @IBOutlet weak var button_SaveThisTown: UIButton!
    
    
    var c1 : piker!
    
    
    @IBAction func button_SaveThisTown(sender: AnyObject) {

        townToAdd = selectedItem

        if townToAdd.nom != "" {
        listeVille.add(townToAdd)
        println("town added")
    }
        
    }
    
    //Recherche la ville dans l'api openweather
    @IBAction func actionSearch(sender: AnyObject) {
        var m = TF_SearchTown.text
        if(TF_SearchTown.text != "")
        {
            items.removeAll(keepCapacity: false)
            items = getCity.getResults(TF_SearchTown.text)

            List_ListeTownFound.reloadAllComponents()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        c1 = piker(pickerInterval: 5)
        //List_ListeTownFound = UIPickerView()
        List_ListeTownFound.delegate = c1
        List_ListeTownFound.dataSource = c1
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
