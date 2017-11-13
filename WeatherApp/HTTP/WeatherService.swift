//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Charles Graffeo on 11/10/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class WeatherService {
    
    public func weatherFromCity(city:String, closure:@escaping (City?,Error?)->Void){
        
        let urlEscapedSearchValue = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let searchUrl = WeatherServiceUrlCreator.weatherFromCity(city: urlEscapedSearchValue!)
        
        Alamofire.request(searchUrl).responseObject { (response:DataResponse<City>) in
            switch response.result {
                case .success(let city):
                    closure(city,nil)
                    break
                case .failure(let error):
                    closure(nil,error)
                    break
            }
        }
    }
}
