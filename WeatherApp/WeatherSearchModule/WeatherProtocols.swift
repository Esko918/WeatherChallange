//
//  SearchWeatherProtocols.swift
//  WeatherApp
//
//  Created by Charles Graffeo on 11/10/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import UIKit

//View to Presenter Commands
protocol WeatherView:class {
    
    var presenter:WeatherPresenterProtocol! { get set }
    
    func showNoInformationScreen()
    func showWeatherForCity(city:CityResponse)
    func errorRetreivingInformation()
    
}

protocol WeatherPresenterProtocol:class {
    weak var view:WeatherView? { get set }
    var interacter:WeatherInteracterInput! { get set }
    var router:WeatherWireFrameProtocol! { get set }

    func didClickSearchButton(city:String)
    
}

//Interactor to Presenter commands
protocol WeatherInteracterInput:class {
    weak var output: WeatherInteracterOutput! { get set }
    func fetchWeatherForCity(city:String)
}

protocol WeatherInteracterOutput:class {
    func cityInformationFetched(city:CityResponse?)
}

protocol WeatherWireFrameProtocol: class {
    weak var viewController: UIViewController? { get set }
    
    static func initialRootController() -> UIViewController
}
