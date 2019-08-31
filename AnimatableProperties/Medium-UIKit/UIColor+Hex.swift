//
//  UIColor+Hex.swift
//  OnboardingCards
//
//  Created by Jon Cardasis on 10/7/18.
//  Copyright © 2018 Jonathan Cardasis. All rights reserved.
//

import UIKit

public extension UIColor {
    public convenience init(hex: Int) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
