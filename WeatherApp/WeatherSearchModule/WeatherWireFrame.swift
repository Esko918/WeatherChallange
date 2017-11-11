//
//  WeatherWireFrame.swift
//  WeatherApp
//
//  Created by Charles Graffeo on 11/10/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import UIKit


//Handles all navigation through application
class WeatherWireFrame: WeatherWireFrameProtocol {
    
    var viewController: UIViewController?
    
    static func initialRootController() -> UIViewController{
        
        let view = WeatherViewController()
        let presenter = WeatherPresenter()
        let interactor = WeatherInteracter()
        let router = WeatherWireFrame()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interacter = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        return view
        
    }
}
