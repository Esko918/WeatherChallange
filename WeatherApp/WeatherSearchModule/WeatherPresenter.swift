//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by Charles Graffeo on 11/10/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import UIKit
//Class that receives input from the view controller and requests data from interater
class WeatherPresenter: WeatherPresenterProtocol{
    
    var view: WeatherView?
    var interacter: WeatherInteracterInput!
    var router: WeatherWireFrameProtocol!
    var cityDisplayed:City?
    
    func didClickSearchButton(city: String) {
        self.interacter.fetchWeatherForCity(city: city)
    }
    
    func loadCityWithCoder(coder:NSCoder){
        
        let decodedCity = coder.decodeObject(forKey: "searchViewControllerCityDisplayed") as! City
        self.cityDisplayed = City(name: decodedCity.name!,
                                       minTemp: decodedCity.minTemp!,
                                       maxTemp: decodedCity.maxTemp!,
                                       tempeture: decodedCity.tempeture!,
                                       sunrise: decodedCity.sunset!,
                                       sunset: decodedCity.sunset!)
    }
    
}

//MARK: Weather Interactor Output Protocol
extension WeatherPresenter:WeatherInteracterOutput{
    func cityWeatherFetched(city: City?) {
        self.cityDisplayed = city
        self.view?.showWeatherForCity(city: city!)
    }
    
    func cityWeatherFetchFailed() {
        self.view?.errorRetreivingInformation()
    }
}
