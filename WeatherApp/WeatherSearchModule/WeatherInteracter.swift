//
//  WeatherInteractor.swift
//  WeatherApp
//
//  Created by Charles Graffeo on 11/10/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import Foundation
//Class that requests data and returns it to the presenter neatly
class WeatherInteracter: WeatherInteracterInput {
    
    var output: WeatherInteracterOutput!
    func fetchWeatherForCity(city: String) {
        let service = WeatherService()
        service.weatherFromCity(city: city) { (city, error) in
            
            //have to check for a property of city to be nil. If the user input a symbol or number or the
            //string they input was an insane string like wdusdfghskdfkjagskjdhfgas. the response would still be successfull
            //but there would be no data in city and the error would still be nil
            if(city?.name == nil || error != nil){
                
                //Would also handle the error here
                self.output.cityWeatherFetchFailed()
                
            }
            else{
                self.saveLastSearchedCity(city: city!)
                self.output.cityWeatherFetched(city: city)
            }
        }
    }
    
    //returns the last search to the outputter
    func fetchLastSearchedCity()throws{

        guard let archivedCity = NSKeyedUnarchiver.unarchiveObject(withFile: self.savedCityFilePath()!) as? City else {
            throw FileSystemError.FileNotFound
        }
        self.output.lastCitySearchFetch(city: archivedCity)
    }
    
    //File path in docs directory to the last search
    private func savedCityFilePath()->String?{
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        let filePath = url?.appendingPathComponent("CityData").path
        return filePath!
    }
    
    //saves the last search to the file disk
    private func saveLastSearchedCity(city:City){
        do{
            guard let filepath = self.savedCityFilePath() else {
                throw FileSystemError.AccessNotGrantedToFilepath
            }
            
            guard NSKeyedArchiver.archiveRootObject(city, toFile: filepath) else {
                throw FileSystemError.FileNotSaved
            }
        }catch FileSystemError.FileNotSaved {
            print("File not saved at path \(self.savedCityFilePath)")
        }catch FileSystemError.AccessNotGrantedToFilepath{
            print("Access to filepath is not granted")
            print("Filepath:\(self.savedCityFilePath)")
        }catch{
            print("Some Other Error")
        }
    }
}
