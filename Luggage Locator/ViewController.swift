//
//  ViewController.swift
//  Luggage Locator
//
//  Created by Sam Davies on 30/08/2014.
//  Copyright (c) 2014 VisualPutty. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
  
  @IBOutlet weak var rssiLabel: PaddedLabel!
  @IBOutlet weak var accuracyLabel: PaddedLabel!
  
  
  var luggageLocationManager: LuggageLocationManager?
                            
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    luggageLocationManager?.startRangingWithCallback({
      [unowned self] beacon in
      self.updateViewWithBeacon(beacon)
    })
  }
  
  func updateViewWithBeacon(beacon: CLBeacon) {
    println("Ranging Result: \(beacon)")
    rssiLabel.text = "\(beacon.rssi)dBm"
    let accuracy = NSString(format: "%0.2f", beacon.accuracy)
    accuracyLabel.text = "\(accuracy)m"
  }
  
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return .LightContent
  }


}

