//
//  CABasicAnimation+Utils.swift
//  GoodGood
//
//  Created by Jon Cardasis on 2/19/19.
//  Copyright © 2019 Jon Cardasis. All rights reserved.
//

import QuartzCore

public extension CABasicAnimation {
    
    /// Creates a CABasicAnimation, copying the animation keys from the provided animation to the new basic animation.
    public convenience init(keyPath: String?, copyingAnimation animation: CAAnimation) {
        self.init(keyPath: keyPath)
        beginTime = animation.beginTime
        duration = animation.duration
        speed = animation.speed
        timeOffset = animation.timeOffset
        repeatCount = animation.repeatCount
        repeatDuration = animation.repeatDuration
        autoreverses = animation.autoreverses
        fillMode = animation.fillMode
        timingFunction = animation.timingFunction
        delegate = animation.delegate
    }
}
