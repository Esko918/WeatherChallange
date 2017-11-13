//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Charles Graffeo on 11/10/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WeatherAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTempertureConverterForKelvinToFarenheight(){
        let kelvin = Float(280.0)
        let result = TempetureConverter.kelvinToFarenheight(kelvin: kelvin)
        let expectedResult = Float(44.3299866)
        XCTAssertEqual(result, expectedResult)
    }
    
}
