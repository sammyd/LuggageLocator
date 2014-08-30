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
  @IBOutlet weak var luggageImageView: UIImageView!
  @IBOutlet weak var overlayImageView: FlashingImageView!
  
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
    rssiLabel.text = "\(beacon.rssi)dBm"
    let accuracy = NSString(format: "%0.2f", beacon.accuracy)
    accuracyLabel.text = "\(accuracy)m"
    switch beacon.proximity {
    case .Unknown:
      showOverlayImageNamed(nil)
    case .Far:
      showOverlayImageNamed("overlay_red")
    case .Immediate:
      showOverlayImageNamed("overlay_green")
    case .Near:
      showOverlayImageNamed("overlay_yellow")
    }
  }
  
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return .LightContent
  }
  
  // MARK: - Utility Methods
  private func showOverlayImageNamed(name: String?) {
    if let name = name {
      luggageImageView.alpha = 1.0
      overlayImageView.hidden = false
      overlayImageView.image = UIImage(named: name)
    } else {
      luggageImageView.alpha = 0.2
      overlayImageView.hidden = true
    }
  }


}

