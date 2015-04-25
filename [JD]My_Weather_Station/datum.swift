//
//  datum.swift
//  [JD]My_Weather_Station
//
//  Created by Developer on 25/04/2015.
//  Copyright (c) 2015 Jennifer D'ROZA And ArchLoy. All rights reserved.//

import Foundation

public class Datum
{
    class func getDay() -> String
    {
        let url = "www.timeapi.org/utc/now.json?%25d%20%25m%20%25Y"
        let data : NSDictionary = GetDatas.parseJSON(url)
        return data["dateString"] as String
    }
}