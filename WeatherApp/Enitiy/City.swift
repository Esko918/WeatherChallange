//
//  City.swift
//  WeatherApp
//
//  Created by Charles Graffeo on 11/10/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import ObjectMapper

class City: NSObject, Mappable {
    
    var name:String?
    var minTemp:Float?
    var maxTemp:Float?
    var tempeture:Float?
    var sunrise:Int?
    var sunset:Int?
    var weather:[Weather]?
    
    required init?(map: Map) { }
    required convenience init?(coder aDecoder: NSCoder) {
        
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let minTemp = aDecoder.decodeFloat(forKey: "minTemp")
        let maxTemp = aDecoder.decodeFloat(forKey: "maxTemp")
        let tempeture = aDecoder.decodeFloat(forKey: "tempeture")
        let sunrise = aDecoder.decodeInteger(forKey: "sunrise")
        let sunset = aDecoder.decodeInteger(forKey: "sunset")
        let weather = aDecoder.decodeObject(forKey: "weather")as! Array<Weather>
        self.init(name: name, minTemp: minTemp, maxTemp: maxTemp, tempeture: tempeture, sunrise: sunrise, sunset: sunset, weather: weather)
        
    }
    
    init(name:String, minTemp:Float, maxTemp:Float,tempeture:Float,sunrise:Int,sunset:Int,weather:[Weather]) {
        
        self.name = name
        self.minTemp = minTemp
        self.maxTemp = maxTemp
        self.tempeture = tempeture
        self.sunrise = sunrise
        self.sunset = sunset
        self.weather = weather
        
    }
    
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

extension City: NSCoding{
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name!, forKey: "name")
        aCoder.encode(minTemp!, forKey: "minTemp")
        aCoder.encode(maxTemp!, forKey: "maxTemp")
        aCoder.encode(tempeture!, forKey: "tempeture")
        aCoder.encode(sunrise!, forKey: "sunrise")
        aCoder.encode(sunset!, forKey: "sunset")
        aCoder.encode(weather!, forKey: "weather")
    }
}
