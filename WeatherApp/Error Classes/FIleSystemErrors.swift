//
//  FIleSystemErrors.swift
//  WeatherApp
//
//  Created by Charles Graffeo on 11/17/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

enum FileSystemError:Error {
    case FileNotFound
    case FileNotSaved
    case AccessNotGrantedToFilepath
}
