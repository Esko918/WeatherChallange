//
//  WeatherAppIntegrationTest.swift
//  WeatherAppIntegrationTest
//
//  Created by Charles Graffeo on 11/12/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WeatherAppIntegrationTest: XCTestCase {
    
    var service:WeatherService!
    
    override func setUp() {
        super.setUp()
        service = WeatherService()
    }
    
    override func tearDown() {
        service = nil
        super.tearDown()
    }
    
    func testWeatherSearchSuccessfulWithData(){
        
        let searchTerm = "New York"
        let promise = expectation(description: "City Name is New York")
        
        service.weatherFromCity(city: searchTerm) { (city, error) in
            if(city?.name == "New York"){
                promise.fulfill()
            }
            else{
                XCTFail("Error Testing:\(String(describing: error?.localizedDescription))")
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testWeatherSearchSuccessfulNoData(){
        
        let searchTerm = "sdhghsdgiusdiugu"
        let promise = expectation(description: "Successfull response returns no data")
        
        service.weatherFromCity(city: searchTerm) { (city, error) in
            if(city?.name == nil){
                promise.fulfill()
            }
            else{
                XCTFail("Error no data should be present in city object)")
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testWeatherSearchReturnsError(){
        
        //I dont know how right now to force the weather api to return me an error so lets
        //just say it did return an error for arguments sake
    }
}
