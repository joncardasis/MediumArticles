//
//  UIFont+BestFit.swift
//  GoodGood
//
//  Created by Jon Cardasis on 5/26/18.
//  Copyright © 2018 Jonathan Cardasis. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func bestFittingFontSize(for text: String, in bounds: CGRect, fontDescriptor: UIFontDescriptor) -> CGFloat {
        let constrainingDimension = min(bounds.width, bounds.height)
        let properBounds = CGRect(origin: .zero, size: bounds.size)
        
        let slices: CGFloat = constrainingDimension * 2.0
        var bestFontSize: CGFloat = constrainingDimension
        
        for fontSize in stride(from: bestFontSize, through: 0, by: -(bestFontSize / slices)) {
            let newFont = UIFont(descriptor: fontDescriptor, size: fontSize)
            let attributedTestString = NSAttributedString(string: text, attributes: [NSAttributedString.Key.font : newFont])
            
            let currentFrame = CGRect(origin: .zero, size: attributedTestString.size())
            
            if properBounds.contains(currentFrame) {
                bestFontSize = fontSize
                break
            }
        }
        
        return bestFontSize
    }
    
    static func bestFittingFont(for text: String, in bounds: CGRect, fontDescriptor: UIFontDescriptor) -> UIFont {
        let bestSize = bestFittingFontSize(for: text, in: bounds, fontDescriptor: fontDescriptor)
        return UIFont(descriptor: fontDescriptor, size: bestSize)
    }
}
