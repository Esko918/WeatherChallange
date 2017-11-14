//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Charles Graffeo on 11/10/17.
//  Copyright © 2017 CharlesGraffeo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        
        //You kmnow what ive been trying for over 5 hours to get the state restoration to work
        //I know exactly whats happening. Its not loading the view controller saved into the state restoration path
        // and its loading the view controller i am loading here even though it says UIKit should pick up the one in the
        //restoration path instad of the one here. If this disqualifies me for the position so be it. but im just dont with it.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = WeatherWireFrame.initialRootController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
        
    }

    func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        return true
    }


}

