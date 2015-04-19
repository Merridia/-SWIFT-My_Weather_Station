//
//  weather.swift
//  [JD]My_Weather_Station
//
//  Created by ArchLoy on 18/04/2015.
//  Copyright (c) 2015 Jennifer D'ROZA And ArchLoy. All rights reserved.
//

import Foundation

class GetDatas
{


    class func parseJSON(urlToRequest: String) -> NSDictionary
    {
        var data : NSData;
        data = NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
        var error: NSError?
        var boardsDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary
    
        return boardsDictionary
    }

}

public class Weather
{

    private var data : NSDictionary;
    private var url = "api.openweathermap.org/data/2.5/weather?"
    private var APPID : String
    private var date : NSDate?
    
    init()
    {
        data = NSDictionary();
        APPID = "e0674ffbcf91cb5380d78b6bc6d4362e"
    }
    
    convenience init(m_lon : String, m_lat : String)
    {
        self.init();
        
        url += "lat="+m_lat+"&lon="+m_lon+"&APPID="+APPID;
    }
    
    convenience init(city: String, ctry: String)
    {
        self.init();
        url += "q="+city+","+ctry
    }
    
    public func update()
    {
        if(date != nil)
        {
            if(date?.timeIntervalSinceNow > -600.0)
            {
                return
            }
        }
        date = NSDate();
        GetDatas.parseJSON(url);
    }
    
    func setPos(m_lon : String, m_lat : String)
    {
        url = "api.openweathermap.org/data/2.5/weather?"
        url += "lat="+m_lat+"&lon="+m_lon+"&APPID="+APPID;
    }
    
    func setCity(city: String, ctry: String)
    {
        url = "api.openweathermap.org/data/2.5/weather?"
        url += "q="+city+","+ctry
    }
    
    func getTemp() -> Int
    {
        return Int((((data["main"] as NSDictionary)["temp"] as Float) - 273.15)+0.5)
    }
    func getPres() -> Int
    {
        return (data["main"] as NSDictionary)["pressure"] as Int
    }
    func getHum() -> Int
    {
        return (data["main"] as NSDictionary)["humidity"] as Int
    }
    func getWind() -> Int
    {
        return Int(((data["wind"] as NSDictionary)["speed"] as Float) * 3.6 )
    }
    func getDesc() -> String
    {
        return ((data["weather"] as NSArray)[0] as NSDictionary)["description"] as String
    }
    
}
















