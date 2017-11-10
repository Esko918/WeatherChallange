//
//  WeatherServiceUrlCreator.swift
//  WeatherApp
//
//  Created by Charles Graffeo on 11/10/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

class WeatherServiceUrlCreator {
    
    static func weatherFromCity(city:String)->String{
        let url = "http://api.openweathermap.org/data/2.5/weather?q=" + city
        return WeatherServiceUrlCreator.appendApiKeyToUrl(url:url)
    }
    
    static func appendApiKeyToUrl(url:String)->String{
        return url + "&APPID=7ea21a282006fda669c6438fff0373d1"
    }
}
