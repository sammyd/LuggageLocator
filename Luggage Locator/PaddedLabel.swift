//
//  PaddedLabel.swift
//  Luggage Locator
//
//  Created by Sam Davies on 30/08/2014.
//  Copyright (c) 2014 VisualPutty. All rights reserved.
//

import UIKit

@IBDesignable
class PaddedLabel: UILabel {

  @IBInspectable
  var verticalPadding: CGFloat = 20.0
  
  @IBInspectable
  var horizontalPadding: CGFloat = 20.0
  
  override func intrinsicContentSize() -> CGSize {
    var size = super.intrinsicContentSize()
    size.width += horizontalPadding
    size.height += verticalPadding
    return size
  }
  
}
