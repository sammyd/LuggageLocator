//
//  LuggageLocationManager.swift
//  Luggage Locator
//
//  Created by Sam Davies on 30/08/2014.
//  Copyright (c) 2014 VisualPutty. All rights reserved.
//

import CoreLocation
import UIKit

class LuggageLocationManager : NSObject, CLLocationManagerDelegate {
  
  typealias RangingCallback = (CLBeacon) -> Void
  
  let locationManager = CLLocationManager()
  let beaconUUID = "7D65B622-4AA8-4560-914C-502BE940BC16"
  var region: CLBeaconRegion {
    return CLBeaconRegion(proximityUUID:NSUUID(UUIDString: beaconUUID), major: 1,
                                  minor: 129, identifier: "LuggageLocator")
  }
  private var rangingCallback: RangingCallback?
  
  override init() {
    super.init()
    locationManager.delegate = self
  }

  deinit {
    stopRanging()
  }
  
  func startMonitoring() {
    locationManager.requestAlwaysAuthorization()
    locationManager.startMonitoringForRegion(region)
    locationManager.delegate = self
  }
  
  func startRangingWithCallback(callback: RangingCallback) {
    stopRanging()
    rangingCallback = callback
    locationManager.startRangingBeaconsInRegion(region)
  }
  
  func stopRanging() {
    locationManager.stopRangingBeaconsInRegion(region)
  }
  
  // MARK: - Delegate
  func locationManager(manager: CLLocationManager!, didEnterRegion region: CLRegion!) {
    if let region = region as? CLBeaconRegion {
      presentNotificationWithBody("Here's your luggage!")
    }
  }
  
  func locationManager(manager: CLLocationManager!, didExitRegion region: CLRegion!) {
    if let region = region as? CLBeaconRegion {
      presentNotificationWithBody("Your luggage has gone!")
    }
  }
  
  func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: CLBeaconRegion!) {
    if let beacon = beacons.first as? CLBeacon {
      rangingCallback?(beacon)
    }
  }
  
  // MARK: - Utility methods
  private func presentNotificationWithBody(body: String) {
    let notification = UILocalNotification()
    notification.alertBody = body
    notification.soundName = "Default"
    UIApplication.sharedApplication().presentLocalNotificationNow(notification)
    
    if UIApplication.sharedApplication().applicationState == .Active {
      let alertView = UIAlertView(title: "LugggageLocator", message: body, delegate: nil, cancelButtonTitle: "OK")
      alertView.show()
    }
  }
  
}