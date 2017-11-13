//
//  StringTempetureExtension.swift
//  WeatherApp
//
//  Created by Charles Graffeo on 11/12/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import UIKit

class TempetureConverter {
    
    static func kelvinToFarenheight(kelvin:Float)->Float{
        let farenheight = kelvin * 9/5 - 459.67
        return farenheight
    }

}
