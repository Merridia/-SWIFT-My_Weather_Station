//
//  weather.swift
//  [JD]My_Weather_Station
//
//  Created by ArchLoy on 18/04/2015.
//  Copyright (c) 2015 Jennifer D'ROZA And ArchLoy. All rights reserved.
//

import Foundation

//!  A internal class.
/*!
This one will not used in core application but just for getting JSON objects from URL.
*/
class GetDatas
{

    //! Get JSON object from url.
    /*!
    \param urlToRequest url requested by user.
    \return NSDictionary that contain JSON
    */
    class func parseJSON(urlToRequest: String) -> NSDictionary
    {
        var data : NSData;
        data = NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
        var error: NSError?
        var boardsDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary
    
        return boardsDictionary
    }

}

//!  Will get weather informations
public class Weather
{

    private var data : NSDictionary;/*!< Will contain last json object from openweathermap server */
    private var url = "api.openweathermap.org/data/2.5/weather?" /*!< url to openweathermap public api, used to access datas. */
    private var APPID : String /*!< private APPID used to get datas from api. Cannot be modify for this version */
    private var date : NSDate? /*!< Date of last data check. Will initialized when first update is being performed */
    
    //! initializer. Will set base APPID and data
    init()
    {
        data = NSDictionary();
        APPID = "e0674ffbcf91cb5380d78b6bc6d4362e"
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
    }
    
    //! Initialize with a city name and country
    /*!
        \param city city to watch
        \param cntry country where city is situated
    */
    convenience init(city: String, ctry: String)
    {
        self.init();
        url += "q="+city+","+ctry
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
        GetDatas.parseJSON(url);
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
        return Int((((data["main"] as NSDictionary)["temp"] as Float) - 273.15)+0.5)
    }
    
    //! Get the current pressure.
    /*!
    \return Pressure, in hPa
    */
    func getPres() -> Int
    {
        return (data["main"] as NSDictionary)["pressure"] as Int
    }
    
    //! Get the current humidity.
    /*!
    \return Humidity, in Percents
    */
    func getHum() -> Int
    {
        return (data["main"] as NSDictionary)["humidity"] as Int
    }
    
    //! Get the current wind speed.
    /*!
    \return Wind speed, in kilometers per hour
    */
    func getWind() -> Int
    {
        return Int(((data["wind"] as NSDictionary)["speed"] as Float) * 3.6 )
    }
    
    //! Get the description of weather.
    /*!
    \return Description, in French
    */
    func getDesc() -> String
    {
        return ((data["weather"] as NSArray)[0] as NSDictionary)["description"] as String
    }
    
}
















