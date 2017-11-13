//
//  WeatherInteractor.swift
//  WeatherApp
//
//  Created by Charles Graffeo on 11/10/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//


//Class that requests data and returns it to the presenter neatly
class WeatherInteracter:WeatherInteracterInput {
    
    var output: WeatherInteracterOutput!
    
    //MARK:- WeatherInteracterInput
    func fetchWeatherForCity(city: String) {
        let service = WeatherService()
        service.weatherFromCity(city: city) { (city, error) in
            self.output.cityInformationFetched(city: city)
            //If there was an error i would log it somewhere and handle it in the presenter
            
        }
    }
    
}
