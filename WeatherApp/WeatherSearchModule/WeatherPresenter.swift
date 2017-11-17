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
    
    func displayLastViewedCityIfPresent(){
        
        do {
           try self.interacter.fetchLastSearchedCity()
        }
        catch FileSystemError.FileNotFound {
            print("Last city searched for file is not present so dont load on screen")
        }
        catch{
            print("Some Other Error which wont occur")
        }
    }
}

//MARK: Weather Interactor Output Protocol
extension WeatherPresenter:WeatherInteracterOutput{
    
    //displays the city that was searched in the view
    func cityWeatherFetched(city: City?) {
        self.cityDisplayed = city
        self.view?.showWeatherForCity(city: city!)
    }
    
    //Displays Error when city cannot be found
    func cityWeatherFetchFailed() {
        self.view?.errorRetreivingInformation()
    }
    
    //Autoloads the last search in the view 
    func lastCitySearchFetch(city:City?){
        if(city != nil){
            self.view?.loadLastSearchInformation(city: city!)
        }
        
    }
}
