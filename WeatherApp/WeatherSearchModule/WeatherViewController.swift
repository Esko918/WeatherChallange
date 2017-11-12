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
    var resultsView:WeatherCityResultsView?
    
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
        
        if(resultsView == nil){
            
            resultsView = WeatherCityResultsView.init(frame: .zero)
            self.view.addSubview(resultsView!)
            
            resultsView?.autoPinEdge(.top, to: .bottom, of: self.searchBar, withOffset: 0)
            resultsView?.autoPinEdge(.leading, to: .leading, of: self.view, withOffset: 0)
            resultsView?.autoPinEdge(.trailing, to: .trailing, of: self.view, withOffset: 0)
            resultsView?.autoPinEdge(.bottom, to: .bottom, of: self.view, withOffset: 0)
            
        }
        
        resultsView?.updateWeatherResults(name: city.name!, tempeture: city.tempeture!)
        self.searchBar.resignFirstResponder()
    }
}

extension WeatherViewController: UITextFieldDelegate{
    
    
    //This is used inorder to not allow the user to input any symbols or numbers in the search field
    //If they send numbers or symbols to the search api it will return nil for all values
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.rangeOfCharacter(from: CharacterSet.letters) != nil{
            return true
        }
        else {
            return false
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.presenter.didClickSearchButton(city: textField.text!)
        return true
    }
}
