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
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateWeatherResults(name:String, tempeture:Float){
        
        nameLbl.text = "Name: " + name
        tempetureLbl.text = "Tempeture: \(tempeture)"
        
    }
    override func updateConstraints() {
        
        if(!didSetConstraints){
            
            nameLbl.autoPinEdge(.top, to: .top, of: self, withOffset: 20)
            nameLbl.autoPinEdge(.leading, to: .leading, of: self, withOffset: 20)
            nameLbl.autoPinEdge(.trailing, to: .trailing, of: self, withOffset: -20)
            
            tempetureLbl.autoPinEdge(.top, to: .bottom, of: self.nameLbl, withOffset: 10)
            tempetureLbl.autoPinEdge(.leading, to: .leading, of: self.nameLbl, withOffset: 0)
            tempetureLbl.autoPinEdge(.trailing, to: .trailing, of: self.nameLbl, withOffset: 0)
        
            
            self.didSetConstraints = true
        }
        super.updateConstraints()
    }
}
