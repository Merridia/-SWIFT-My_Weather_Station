//
//  getDatas.swift
//  [JD]My_Weather_Station
//
//  Created by Developer on 25/04/2015.
//  Copyright (c) 2015 Jennifer D'ROZA And ArchLoy. All rights reserved.//

import Foundation

//!  Http requester class.
/*!
This one will not used in core application but just for getting JSON objects from URL.
*/
public class GetDatas
{
    
    //! Get JSON object from url.
    /*!
    \param urlToRequest url requested by user.
    \return NSDictionary that contain JSON
    */
    func parseJSON(urlToRequest: String) -> NSDictionary?
    {
        var data : NSData?;
        var ur = NSURL(string: "http://"+urlToRequest)
        var response : NSURLResponse?
        
        var error: NSError?
        
        data = NSURLConnection.sendSynchronousRequest(NSURLRequest(URL: ur!), returningResponse: &response, error: &error)!
            //NSData(contentsOfURL: ur!, options: nil, error: &error)!
        
        var boardsDictionary: NSDictionary
        var cc = (response as NSHTTPURLResponse).statusCode
        if( error == nil && cc == 200)
        {
            boardsDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary
        
            return boardsDictionary
        }
        return nil
    }
    
}