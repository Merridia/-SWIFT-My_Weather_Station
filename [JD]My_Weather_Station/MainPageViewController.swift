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
    
    var weather : Weather!
    var loc : Locate!
    var timer : NSTimer!
    
    
    func update()
    {
        if(loc.getLon() != "")
        {
            if(weather == nil)
            {
                weather = Weather(m_lon: loc.getLon(), m_lat: loc.getLat())
            }
            townNameShow.text = weather.getCity()
        }
        else
        {
            townNameShow.text = "Please wait for location detect"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        
        loc = Locate()

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
