//
//  Weather.swift
//  WeatherApp
//
//  Created by Charles Graffeo on 11/10/17.

//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import ObjectMapper

class Weather: NSObject,Mappable {
    
    var main:String?
    var weatherDescription:String?
    var icon:String?
    
    required init?(map: Map) { }
    required convenience init?(coder aDecoder: NSCoder) {
        let main = aDecoder.decodeObject(forKey: "main") as! String
        let weatherDescription = aDecoder.decodeObject(forKey: "weatherDescription") as! String
        let icon = aDecoder.decodeObject(forKey: "icon") as! String
        
        self.init(main: main, weatherDescription: weatherDescription, icon: icon)
    }
    
    init(main:String, weatherDescription:String, icon:String){
        self.main = main
        self.weatherDescription = weatherDescription
        self.icon = icon
    }
    func mapping(map: Map) {
        main <- map["main"]
        icon <- map["icon"]
        weatherDescription <- map["description"]
    }
}

extension Weather:NSCoding{
    func encode(with aCoder: NSCoder) {
        aCoder.encode(main!, forKey: "main")
        aCoder.encode(weatherDescription!, forKey: "weatherDescription")
        aCoder.encode(icon!, forKey: "icon")
    }
    
    
}
