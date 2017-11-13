//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by Charles Graffeo on 11/10/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//


//Class that receives input from the view controller and requests data from interater
class WeatherPresenter: WeatherPresenterProtocol{
    
    var view: WeatherView?
    var interacter: WeatherInteracterInput!
    var router: WeatherWireFrameProtocol!
    var cityDisplayed:City?
    
    func didClickSearchButton(city: String) {
        self.interacter.fetchWeatherForCity(city: city)
    }
}

//MARK: Weather Interactor Output Protocol
extension WeatherPresenter:WeatherInteracterOutput{
    func cityInformationFetched(city: City?) {
        //If the user input some insane value like hudehuehudhudheh, or a symbol or number
        //the WeatherAPi would return nil for all values and the response of WeatherServcice would still return successful. So check for a nil.
        //value for name, if so dont update the view and show alert message
        if((city?.name) != nil){
            self.view?.showWeatherForCity(city: city!)
        }
        else{
            self.cityDisplayed = city
            self.view?.errorRetreivingInformation()
        }
    }
}
