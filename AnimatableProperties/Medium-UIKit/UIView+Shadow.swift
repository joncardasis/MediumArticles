//
//  UIView+Shadow.swift
//  OnboardingCards
//
//  Created by Jon Cardasis on 10/7/18.
//  Copyright © 2018 Jonathan Cardasis. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func applyDropShadow(color: UIColor, opacity: Float, offset: CGSize, radius: CGFloat) {
        self.clipsToBounds = false
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    public func removeDropShadow() {
        layer.shadowColor = nil
        layer.shadowOpacity = 0
    }
}
