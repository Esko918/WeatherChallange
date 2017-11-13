//
//  DateExtension.swift
//  WeatherApp
//
//  Created by Charles Graffeo on 11/13/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import UIKit

extension Date{

    func timeOfDate(time:Int)->String{
        
        let date = Date.init(timeIntervalSince1970: TimeInterval(time))
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.setLocalizedDateFormatFromTemplate("hh:mm:ss")
        
        return formatter.string(from: date)
        
    }

}

