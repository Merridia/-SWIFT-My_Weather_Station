//
//  MainPageViewController.swift
//  [JD]My_Weather_Station
//
//  Created by Developer on 13/04/2015.
//  Copyright (c) 2015 Jennifer D'ROZA. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

    @IBOutlet weak var townNameShow: UITextField!
    
    @IBOutlet weak var labelTodayDate: UILabel!
    
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var labelTodayTemp: UILabel!
    
    @IBOutlet weak var labelTodayPress: UILabel!
    
    @IBOutlet weak var labelTodayHum: UILabel!
    
    @IBOutlet weak var labelWeatherCondition: UILabel!
    
    @IBOutlet weak var conditionImageView: UIImageView!
    
    @IBOutlet weak var buttonMoreInformations: UIBarButtonItem!
    
    @IBOutlet weak var buttonAddTown: UIBarButtonItem!
    
    @IBOutlet weak var buttonChangeTown: UIBarButtonItem!
    
    
    
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
    
   @IBOutlet weak var Itembarclick: UIBarButtonItem!

}
