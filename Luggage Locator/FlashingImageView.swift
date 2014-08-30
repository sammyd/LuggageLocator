//
//  FlashingImageView.swift
//  Luggage Locator
//
//  Created by Sam Davies on 30/08/2014.
//  Copyright (c) 2014 VisualPutty. All rights reserved.
//

import UIKit

class FlashingImageView: UIImageView {
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    registerForFlashing()
    startFlashing()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    registerForFlashing()
    startFlashing()
  }
  
  override init(image: UIImage!) {
    super.init(image: image)
    registerForFlashing()
    startFlashing()
  }
  
  deinit {
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }
  
  func registerForFlashing() {
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "startFlashing",
                                                     name: UIApplicationWillEnterForegroundNotification, object: nil)
  }
  
  func startFlashing() {
    self.alpha = 1.0
    UIView.animateWithDuration(0.6, delay: 0.0, options: .Autoreverse | .Repeat | .CurveEaseInOut, animations: {
      self.alpha = 0.5
    }, completion: nil)
  }
}
