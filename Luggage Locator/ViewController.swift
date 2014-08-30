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
  }


}

