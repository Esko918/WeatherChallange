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
    
    func fetchWeatherForCity(city: String) {
        let service = WeatherService()
        service.weatherFromCity(city: city) { (city, error) in
            
            //have to check for a property of city to be nil. If the user input a symbol or number or the
            //string they input was an insane string like wdusdfghskdfkjagskjdhfgas. the response would still be successfull
            //but there would be no data in city and the error would still be nil
            if(city?.name == nil || error != nil){
                
                //Would also handle the error here
                self.output.cityWeatherFetchFailed()
                
            }
            else{
                self.output.cityWeatherFetched(city: city)
            }
            
        }
    }
    
}
