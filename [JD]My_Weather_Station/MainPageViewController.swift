//
//  MainPageViewController.swift
//  [JD]My_Weather_Station
//
//  Created by Developer on 13/04/2015.
//  Copyright (c) 2015 Jennifer D'ROZA And ArchLoy. All rights reserved.//

import UIKit

class MainPageViewController: UIViewController {
    
    @IBOutlet weak var labelCurrentTown: UILabel!
    
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

    @IBOutlet weak var imageTemp: UIImageView!
    
    @IBOutlet weak var imageCelsus: UIImageView!
    
    @IBOutlet weak var imagePressure: UIImageView!
    
    @IBOutlet weak var imageWeatherCondition: UIImageView!
    
    @IBOutlet weak var imageHumidityLevel: UIImageView!
    
    func firstUpdate()
    {
        if(loc.getLon() != "")
        {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(300, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
            
            weather = Weather(m_lon: loc.getLon(), m_lat: loc.getLat())
            
            labelTodayDate.text = Datum.getDay()
            update();
        }
        else
        {
            labelCurrentTown.text = "Please wait for location detect"
        }
    }
    
    func update()
    {
        weather.update();
        
        labelCurrentTown.text = weather.getCity()
        labelTodayTemp.text = weather.getTemp().description
        labelTodayPress.text = weather.getPres().description
        labelTodayHum.text = weather.getHum().description
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: Selector("firstUpdate"), userInfo: nil, repeats: true)
        
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
