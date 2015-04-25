//
//  getDatas.swift
//  [JD]My_Weather_Station
//
//  Created by Developer on 25/04/2015.
//  Copyright (c) 2015 Jennifer D'ROZA. All rights reserved.
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
        var ur = NSURL(string: "http://"+urlToRequest)
        
        
        var error: NSError?
        //data = NSData(contentsOfURL: ur!)!
        
        data = NSData(contentsOfURL: ur!, options: nil, error: &error)!
        
        var boardsDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        
        return boardsDictionary
    }
    
}