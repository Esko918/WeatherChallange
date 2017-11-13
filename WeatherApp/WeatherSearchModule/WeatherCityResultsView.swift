//
//  WeatherCityResultsView.swift
//  WeatherApp
//
//  Created by Charles Graffeo on 11/12/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import UIKit
import PureLayout

class WeatherCityResultsView: UIView {

    var didSetConstraints = false
    var nameLbl = UILabel().configureForAutoLayout()
    var tempetureLbl = UILabel().configureForAutoLayout()
    var minTempLbl = UILabel().configureForAutoLayout()
    var maxTempLbl = UILabel().configureForAutoLayout()
    var sunsetLbl = UILabel().configureForAutoLayout()
    var sunriseLbl = UILabel().configureForAutoLayout()
    var weatherMainLbl = UILabel().configureForAutoLayout()
    var weatherIconLbl = UILabel().configureForAutoLayout()
    var weatherDescriptionLbl = UILabel().configureForAutoLayout()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.configureForAutoLayout()
        
        self.addSubview(nameLbl)
        self.addSubview(tempetureLbl)
        self.addSubview(minTempLbl)
        self.addSubview(maxTempLbl)
        self.addSubview(sunsetLbl)
        self.addSubview(sunriseLbl)
        self.addSubview(weatherMainLbl)
        self.addSubview(weatherIconLbl)
        self.addSubview(weatherDescriptionLbl)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateWeatherResults(name:String, tempeture:Float, minTemp:Float, maxTemp:Float,sunset:Int,sunrise:Int, weatherMain:String, weatherDescription:String, weatherIcon:String){
        
        nameLbl.text = "Name: " + name
        tempetureLbl.text = "Tempeture: \(tempeture)"
        minTempLbl.text = "Min Temp: \(minTemp)"
        maxTempLbl.text = "Max Temp: \(maxTemp)"
        sunriseLbl.text = "Hours Till Sunrise: \(sunrise)"
        sunsetLbl.text = "Hours Till SunSet: \(sunset)"
        weatherMainLbl.text = "\(weatherMain)"
        weatherDescriptionLbl.text = "\(weatherDescription)"
        weatherIconLbl.text = "\(weatherIcon)"
        
    }
    
    override func updateConstraints() {
        
        if(!didSetConstraints){
            
            nameLbl.autoPinEdge(.top, to: .top, of: self, withOffset: 20)
            nameLbl.autoPinEdge(.leading, to: .leading, of: self, withOffset: 20)
            nameLbl.autoPinEdge(.trailing, to: .trailing, of: self, withOffset: -20)
            
            tempetureLbl.autoPinEdge(.top, to: .bottom, of: self.nameLbl, withOffset: 10)
            tempetureLbl.autoPinEdge(.leading, to: .leading, of: self.nameLbl, withOffset: 0)
            tempetureLbl.autoPinEdge(.trailing, to: .trailing, of: self.nameLbl, withOffset: 0)
            
            minTempLbl.autoPinEdge(.top, to: .bottom, of: self.tempetureLbl, withOffset: 10)
            minTempLbl.autoPinEdge(.leading, to: .leading, of: self.tempetureLbl, withOffset: 0)
            minTempLbl.autoPinEdge(.trailing, to: .trailing, of: self.tempetureLbl, withOffset: 0)
            
            maxTempLbl.autoPinEdge(.top, to: .bottom, of: self.minTempLbl, withOffset: 10)
            maxTempLbl.autoPinEdge(.leading, to: .leading, of: self.minTempLbl, withOffset: 0)
            maxTempLbl.autoPinEdge(.trailing, to: .trailing, of: self.minTempLbl, withOffset: 0)
            
            sunsetLbl.autoPinEdge(.top, to: .bottom, of: self.maxTempLbl, withOffset: 10)
            sunsetLbl.autoPinEdge(.leading, to: .leading, of: self.maxTempLbl, withOffset: 0)
            sunsetLbl.autoPinEdge(.trailing, to: .trailing, of: self.maxTempLbl, withOffset: 0)
            
            sunriseLbl.autoPinEdge(.top, to: .bottom, of: self.sunsetLbl, withOffset: 10)
            sunriseLbl.autoPinEdge(.leading, to: .leading, of: self.sunsetLbl, withOffset: 0)
            sunriseLbl.autoPinEdge(.trailing, to: .trailing, of: self.sunsetLbl, withOffset: 0)
            
            weatherMainLbl.autoPinEdge(.top, to: .bottom, of: self.sunriseLbl, withOffset: 10)
            weatherMainLbl.autoPinEdge(.leading, to: .leading, of: self.sunriseLbl, withOffset: 0)
            weatherMainLbl.autoPinEdge(.trailing, to: .trailing, of: self.sunriseLbl, withOffset: 0)
            
            weatherIconLbl.autoPinEdge(.top, to: .bottom, of: self.weatherMainLbl, withOffset: 10)
            weatherIconLbl.autoPinEdge(.leading, to: .leading, of: self.weatherMainLbl, withOffset: 0)
            weatherIconLbl.autoPinEdge(.trailing, to: .trailing, of: self.weatherMainLbl, withOffset: 0)
            
            weatherDescriptionLbl.autoPinEdge(.top, to: .bottom, of: self.weatherIconLbl, withOffset: 10)
            weatherDescriptionLbl.autoPinEdge(.leading, to: .leading, of: self.weatherIconLbl, withOffset: 0)
            weatherDescriptionLbl.autoPinEdge(.trailing, to: .trailing, of: self.weatherIconLbl, withOffset: 0)
        
            
            self.didSetConstraints = true
        }
        super.updateConstraints()
    }
}
