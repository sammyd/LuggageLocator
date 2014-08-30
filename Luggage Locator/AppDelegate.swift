//
//  AppDelegate.swift
//  Luggage Locator
//
//  Created by Sam Davies on 30/08/2014.
//  Copyright (c) 2014 VisualPutty. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
  var window: UIWindow?
  let luggageLocationManager = LuggageLocationManager()

  func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
    // Override point for customization after application launch.
    luggageLocationManager.startMonitoring()
    if let vc = window?.rootViewController as? ViewController {
      vc.luggageLocationManager = luggageLocationManager
    }
    return true
  }

}

