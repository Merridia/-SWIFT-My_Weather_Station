//
//  weather.swift
//  [JD]My_Weather_Station
//
//  Created by ArchLoy on 18/04/2015.
//  Copyright (c) 2015 Jennifer D'ROZA And ArchLoy. All rights reserved.
//

import Foundation

var weather : Weather = Weather(m_lon: "131.8999999", m_lat: "43.133333")

public class getCity
{
    class func getResults(ctyName : String) -> [Ville]
    {
        let req = GetDatas()
        var dat : NSDictionary?
        dat=req.parseJSON("api.openweathermap.org/data/2.5/find?q="+ctyName+"&type=accurate&mode=json&APPID=e0674ffbcf91cb5380d78b6bc6d4362e")
        
        var ret : [Ville]
        ret = [Ville]()
        
        if(dat != nil)
        {
            var cnt = dat!["count"] as Int
        
            for(var i=0; i<cnt; i++)
            {
            
                var vl = Ville(m_nom: (dat!["list"] as NSArray)[0]["name"] as String, m_longitude: (((dat!["list"] as NSArray)[0]["coord"] as NSDictionary)["lon"] as Float).description, m_latitude: (((dat!["list"] as NSArray)[0]["coord"] as NSDictionary)["lat"] as Float).description)
                vl.setCntry((((dat!["list"] as NSArray)[0] as NSDictionary)["sys"] as NSDictionary)["country"] as String)
            
                ret.append(vl)
            }
            return ret
        }
        ret.append(Ville(m_nom: "Vladivostok", m_longitude: "131.89999", m_latitude: "43.13333"))
        ret[0].setCntry("RU")
        return ret
    }
}

//!  Will get weather informations
public class Weather
{

    private var data : NSDictionary?;/*!< Will contain last json object from openweathermap server */
    private var url = "api.openweathermap.org/data/2.5/weather?" /*!< url to openweathermap public api, used to access datas. */
    private var APPID : String /*!< private APPID used to get datas from api. Cannot be modify for this version */
    private var date : NSDate? /*!< Date of last data check. Will initialized when first update is being performed */
    private var recever : GetDatas /*!< Used for http requests */
    
    //! initializer. Will set base APPID and data
    init()
    {
        APPID = "e0674ffbcf91cb5380d78b6bc6d4362e"
        recever = GetDatas();
    }

    //! Initialize with lattitude and longitude informations
    /*!
        \param m_lon longitude of user
        \param m_lat lattitude of user
    */
    convenience init(m_lon : String, m_lat : String)
    {
        self.init();
        
        url += "lat="+m_lat+"&lon="+m_lon+"&APPID="+APPID;
        update()
    }
    
    //! Initialize with a city name and country
    /*!
        \param city city to watch
        \param cntry country where city is situated
    */
    convenience init(city: String, ctry: String)
    {
        self.init();
        url += "q="+city+","+ctry+"&APPID="+APPID;
        update()
    }
    
    //! Update the datas by requesting the url
    /*!
        Only one request is set for time interva of 10 minutes. 
        It's required by openweathermap's api, because they think that the weather don't change in less than 10 minutes...
    */
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
        data = recever.parseJSON(url);
    }
    
    //! Set the position of user
    /*
        if user move so far, so fast
    \sa init(m_lon, m_lat)
    */
    func setPos(m_lon : String, m_lat : String)
    {
        url = "api.openweathermap.org/data/2.5/weather?"
        url += "lat="+m_lat+"&lon="+m_lon+"&APPID="+APPID;
    }
    
    //! Set position of city
    /*
    if user move so far, so fast
    \sa init(city, cntry)
    */
    func setCity(city: String, ctry: String)
    {
        url = "api.openweathermap.org/data/2.5/weather?"
        url += "q="+city+","+ctry
    }
    
    //! Get the current temperature.
    /*!
    \return Temperature, in Celsius degree
    */
    func getTemp() -> Int
    {
        if(data != nil)
        {
            return Int((((data!["main"] as NSDictionary)["temp"] as Float) - 273.15)+0.5)
        }
        return 0
    }
    
    //! Get the current pressure.
    /*!
    \return Pressure, in hPa
    */
    func getPres() -> Int
    {
        if(data != nil)
        {
            return (data!["main"] as NSDictionary)["pressure"] as Int
        }
        return 0
    }
    
    //! Get the current humidity.
    /*!
    \return Humidity, in Percents
    */
    func getHum() -> Int
    {
        if(data != nil)
        {
            return (data!["main"] as NSDictionary)["humidity"] as Int
        }
        return 0
    }
    
    //! Get the current wind speed.
    /*!
    \return Wind speed, in kilometers per hour
    */
    func getWind() -> Int
    {
        if(data != nil)
        {
            return Int(((data!["wind"] as NSDictionary)["speed"] as Float) * 3.6 )
        }
        return 0
        
    }
    
    //! Get the description of weather.
    /*!
    \return Description, in French
    */
    func getDesc() -> String
    {
        if(data != nil)
        {
            return ((data!["weather"] as NSArray)[0] as NSDictionary)["description"] as String
        }
        return "Error : cannot get weather informations, please try again"
    }
    
    //! Get the city watched.
    /*!
    \return city
    */
    func getCity() -> String
    {
        if(data != nil)
        {
            return data!["name"] as String
        }
        return "Vladivostok"
    }
    func getAll() -> [String:String]
    {
        var ret = [String:String]()
        
        ret["Temperature"]=getTemp().description + " °C"
        ret["ForceVent"]=getWind().description + " Km/h"
        ret["Humidity"]=getHum().description + " %"
        ret["Pression"]=getPres().description + " hPa"
        ret["Description"]=getDesc() + "."
        
        
        return ret;
    }
}
















