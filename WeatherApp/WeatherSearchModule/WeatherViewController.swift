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
    var city:CityResponse?
    
    let searchBar = UITextField().configureForAutoLayout()

    override func viewDidLoad() {
        self.initialViewSetup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initialViewSetup(){
        
        self.view.backgroundColor = UIColor.white
        
        searchBar.placeholder = "Search For City"
        searchBar.returnKeyType = .search
        searchBar.borderStyle = .roundedRect
        searchBar.delegate = self
        self.view.addSubview(searchBar)
        
        view.setNeedsUpdateConstraints()
        view.updateConstraintsIfNeeded()
        
    }
    func loadNewCityData(){
        
    }
    
    override func updateViewConstraints() {
        
        if !autolayoutConfigured {
            
            searchBar.autoPinEdge(.top, to: .top, of: self.view, withOffset: 20)
            searchBar.autoPinEdge(.leading, to: .leading, of: self.view)
            searchBar.autoPinEdge(.trailing, to: .trailing, of: self.view)
            searchBar.autoSetDimension(.height, toSize: 40)
            
            autolayoutConfigured = true
        }
        
        super.updateViewConstraints()
    }
}

extension WeatherViewController: WeatherView{
    
    func errorRetreivingInformation() {
        let alert = UIAlertController.init(title: "Error",
                                           message: "Something went wrong when searching for your city",
                                           preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func showNoInformationScreen() {
        //Temp
    }
    
    func showWeatherForCity(city: CityResponse) {
        //Temp
    }
}

extension WeatherViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.presenter.didClickSearchButton(city: textField.text!)
        return true
    }
}
