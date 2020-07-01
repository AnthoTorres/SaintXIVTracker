//
//  AppDelegate.swift
//  Destiny2StatTracker
//
//  Created by Anthony Torres on 1/9/20.
//  Copyright © 2020 Anthony Torres. All rights reserved.
//

import UIKit

var currentGuardian: Guardian? = nil
var selectedCharacter: Player? = nil
var currentPlatform: Platform = .playstation

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
}
