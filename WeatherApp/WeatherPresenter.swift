//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by Charles Graffeo on 11/10/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import UIKit

//View to Presenter Commands
protocol WeatherViewInterface:class {
    
    func showNoInformationScreen()
    func showWeatherForCity(city:String)
    
}

//Interactor to Presenter commands
protocol WeatherViewPresenterOutput:class {
    func cityInformationFetched(city:CityResponse?)
}

//UI Logic
class WeatherPresenter: WeatherViewInterface, WeatherViewPresenterOutput {
    
    
    weak var weatherViewController:WeatherViewController?
    weak var weatherInteractor:WeatherInteractor?
    
    // MARK:- Weather View Interface
    func showNoInformationScreen() {
        print("No")
    }
    
    func showWeatherForCity(city: String) {
        print("No")
    }
    
    // MARK:- Weather View Presenter Output
    func cityInformationFetched(city: CityResponse?){
        
    }
    
    
    

}
