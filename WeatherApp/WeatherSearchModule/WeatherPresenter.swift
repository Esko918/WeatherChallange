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
    
    //Add Router When Needed
    func didClickSearchButton(city: String) {
        self.interacter.fetchInformationFromCity(city: city)
    }
}

extension WeatherPresenter:WeatherInteracterOutput{
    func cityInformationFetched(city: CityResponse?) {
        
        //Load city to view from here
        guard let city = city else{
            
            
            return
        }
        
    }
}
