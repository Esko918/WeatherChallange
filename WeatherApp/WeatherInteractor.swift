//
//  WeatherInteractor.swift
//  WeatherApp
//
//  Created by Charles Graffeo on 11/10/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//


//Data Logic

protocol WeatherInteracterInput:class {
    func informationForCity(city:String)->CityResponse?
}
class WeatherInteractor:WeatherInteracterInput {
    
    weak var presenter:WeatherPresenter?
    
    //MARK:- WeatherInteracterInput
    func informationForCity(city: String) -> CityResponse? {
        print("No")
        return nil
    }
    

}
