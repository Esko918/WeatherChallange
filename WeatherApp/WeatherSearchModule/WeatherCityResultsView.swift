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
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.configureForAutoLayout()
        
        self.addSubview(nameLbl)
        self.addSubview(tempetureLbl)
        self.addSubview(minTempLbl)
        self.addSubview(maxTempLbl)
        self.addSubview(sunsetLbl)
        self.addSubview(sunriseLbl)
     
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateWeatherResults(name:String, tempeture:Float, minTemp:Float, maxTemp:Float,sunset:String,sunrise:String){
        
        nameLbl.text = "\(name)"
        tempetureLbl.text = "Temperture: \(String(format:"%.2f",tempeture))F"
        minTempLbl.text = "Min Temp: \(String(format:"%.2f",minTemp))F"
        maxTempLbl.text = "Max Temp: \(String(format:"%.2f",maxTemp))F"
        sunriseLbl.text = "Sunrise: \(sunrise)"
        sunsetLbl.text = "Sunset: \(sunset)"
        
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
            
            self.didSetConstraints = true
        }
        super.updateConstraints()
    }
}
