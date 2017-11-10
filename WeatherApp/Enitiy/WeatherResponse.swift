//
//  Weather.swift
//  WeatherApp
//
//  Created by Charles Graffeo on 11/10/17.

//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import ObjectMapper

class WeatherResponse: Mappable {
    
    var main:String?
    var weatherDescription:String?
    var icon:String?
    
    required init?(map: Map) {
         mapping(map: map)
    }
    
    func mapping(map: Map) {
        main <- map["main"]
        icon <- map["icon"]
        weatherDescription <- map["description"]
        
    }
    
    
}
