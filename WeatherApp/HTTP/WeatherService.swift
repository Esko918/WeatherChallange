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

    public func weatherFromCity(city:String, closure:@escaping (CityResponse?,Error?)->Void){
        
        let urlEscapedSearchValue = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let searchUrl = WeatherServiceUrlCreator.weatherFromCity(city: urlEscapedSearchValue!)
        
        Alamofire.request(searchUrl).responseObject { (response:DataResponse<CityResponse>) in
            switch response.result {
                case .success:
                    let cityResponse = response.result.value
                    closure(cityResponse,nil)
                    break
                case .failure:
                    closure(nil,response.error)
                    break
            }
        }
    }
}
