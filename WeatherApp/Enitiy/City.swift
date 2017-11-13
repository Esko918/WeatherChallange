//
//  City.swift
//  WeatherApp
//
//  Created by Charles Graffeo on 11/10/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import ObjectMapper

class City: Mappable {
    
    var name:String?
    var minTemp:Float?
    var maxTemp:Float?
    var tempeture:Float?
    var sunrise:Int?
    var sunset:Int?
    var weather:[Weather]?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        
        name <- map["name"]
        minTemp <- map["main.temp_min"]
        maxTemp <- map["main.temp_max"]
        tempeture <- map["main.temp"]
        sunrise <- map["sys.sunrise"]
        sunset <- map["sys.sunset"]
        weather <- map["weather"]
    }
    
}
