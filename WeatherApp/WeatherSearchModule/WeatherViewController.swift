//
//  ViewController.swift
//  WeatherApp
//
//  Created by Charles Graffeo on 11/10/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import UIKit
import PureLayout

class WeatherViewController: UIViewController {
    
    var autolayoutConfigured = false
    var presenter:WeatherPresenterProtocol!
    var resultsView:WeatherCityResultsView!
    
    let searchBar = UITextField().configureForAutoLayout()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.initialViewSetup()
        presenter.displayLastViewedCityIfPresent()
        
    }
    
    func initialViewSetup(){
        
        self.view.backgroundColor = UIColor.white
        searchBar.placeholder = "Search For City"
        searchBar.returnKeyType = .search
        searchBar.borderStyle = .roundedRect
        searchBar.delegate = self
        self.view.addSubview(searchBar)
        
        resultsView = WeatherCityResultsView.init(frame: .zero)
        self.view.addSubview(resultsView!)
        
        
        view.setNeedsUpdateConstraints()
        view.updateConstraintsIfNeeded()
        
    }
    
    override func updateViewConstraints() {
        
        if !autolayoutConfigured {
            
            searchBar.autoPinEdge(.top, to: .top, of: self.view, withOffset: 20)
            searchBar.autoPinEdge(.leading, to: .leading, of: self.view)
            searchBar.autoPinEdge(.trailing, to: .trailing, of: self.view)
            searchBar.autoSetDimension(.height, toSize: 40)
            
            resultsView?.autoPinEdge(.top, to: .bottom, of: self.searchBar, withOffset: 0)
            resultsView?.autoPinEdge(.leading, to: .leading, of: self.view, withOffset: 0)
            resultsView?.autoPinEdge(.trailing, to: .trailing, of: self.view, withOffset: 0)
            resultsView?.autoPinEdge(.bottom, to: .bottom, of: self.view, withOffset: 0)
            
            
            autolayoutConfigured = true
        }
        
        super.updateViewConstraints()
    }
}

//MARK: Weather View Protocol
extension WeatherViewController: WeatherView{
    
    //Displays alert if any results from search api was not sucessfull
    func errorRetreivingInformation() {
        self.searchBar.text = ""
        let alert = UIAlertController.init(title: "Whoops",
                                           message: "City Was Not Found",
                                           preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //Updates the weather results on screen
    func showWeatherForCity(city: City) {
    
        let tempeture = TempetureConverter.kelvinToFarenheight(kelvin: city.tempeture!)
        let minTemp = TempetureConverter.kelvinToFarenheight(kelvin: city.minTemp!)
        let maxTemp = TempetureConverter.kelvinToFarenheight(kelvin: city.maxTemp!)
        let sunsetTime = Date().timeOfDate(time: city.sunset!)
        let sunriseTime = Date().timeOfDate(time: city.sunrise!)
        
        resultsView?.updateWeatherResults(name: city.name!, tempeture: tempeture, minTemp: minTemp, maxTemp: maxTemp, sunset: sunsetTime, sunrise: sunriseTime)
        self.searchBar.resignFirstResponder()
    }
    
    func loadLastSearchInformation(city:City){
        self.searchBar.text = city.name
        self.showWeatherForCity(city: city)
    }
}

//MARK: Textfield Delegate
extension WeatherViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.presenter.didClickSearchButton(city: textField.text!)
        return true
    }
}
