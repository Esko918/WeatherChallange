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

//Presenter to Interacter
//Calls to the interacter to gather some data to display
protocol WeatherInteracterInput:class {
    weak var output: WeatherInteracterOutput! { get set }
    func fetchWeatherForCity(city:String)
}

//Interactor to Presrenter
//Data retreived from the interactor would be sent back to the presenter
//Seperates the Data Logic from the View Logic
protocol WeatherInteracterOutput:class {
    func cityInformationFetched(city:CityResponse?)
}


//This is where all the navigation to and from another view conteroller would happen
protocol WeatherWireFrameProtocol: class {

    weak var viewController: UIViewController? { get set }
    static func initialRootController() -> UIViewController
}
