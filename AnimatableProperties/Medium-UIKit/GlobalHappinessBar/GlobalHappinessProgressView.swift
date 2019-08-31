//
//  GlobalHappinessProgressView.swift
//  GoodGood
//
//  Created by Jon Cardasis on 2/19/19.
//  Copyright © 2019 Jon Cardasis. All rights reserved.
//

import UIKit

public class GlobalHappinessProgressView: UIView {
    
    @objc public dynamic var progress: CGFloat = 0.0 {
        didSet {
            progressLayer.progress = progress
            progressLayer.setNeedsDisplay()
        }
    }
    
    @objc public dynamic var color: CGColor = UIColor.black.cgColor {
        didSet {
            progressLayer.color = color
            progressLayer.setNeedsDisplay()
        }
    }
    
    fileprivate var progressLayer: GlobalHappinessProgressLayer {
        return layer as! GlobalHappinessProgressLayer
    }
    
    override public class var layerClass: AnyClass {
        return GlobalHappinessProgressLayer.self
    }
    
    //var animationBlocked: Bool = true
    
    override public func action(for layer: CALayer, forKey event: String) -> CAAction? {
        if event == #keyPath(GlobalHappinessProgressLayer.progress),
            let action: CAAnimation = currentAnimationContext(in: layer) {
            let animation = CABasicAnimation(keyPath: #keyPath(GlobalHappinessProgressLayer.progress), copyingAnimation: action)
            animation.fromValue = progressLayer.presentation()?.progress
            animation.toValue = progress
            animation.beginTime = CACurrentMediaTime() + action.beginTime // Assign delay
            return animation
        }
        else if event == #keyPath(GlobalHappinessProgressLayer.color),
            let action: CAAnimation = currentAnimationContext(in: layer) {
            let animation = CABasicAnimation(keyPath: #keyPath(GlobalHappinessProgressLayer.color), copyingAnimation: action)
            animation.fromValue = progressLayer.presentation()?.color
            animation.toValue = color
            animation.beginTime = CACurrentMediaTime() + action.beginTime
            return animation
        }
        
        return super.action(for: layer, forKey: event)
    }
    
    private func currentAnimationContext(in layer: CALayer) -> CAAnimation? {
        /// The UIView animation implementation is private, so to check if the view is animating and
        /// get its property keys we can use the key "backgroundColor" since its been a property of
        /// UIView which has been forever and returns a CABasicAnimation.
        return action(for: layer, forKey: #keyPath(backgroundColor)) as? CAAnimation
    }
}

fileprivate class GlobalHappinessProgressLayer: CALayer {
    @NSManaged var progress: CGFloat
    @NSManaged var color: CGColor
    
    override class func needsDisplay(forKey key: String) -> Bool {
        if key == #keyPath(progress) || key == #keyPath(color) {
            return true
        }
        return super.needsDisplay(forKey: key)
    }
    
    override func draw(in ctx: CGContext) {
        super.draw(in: ctx)
        UIGraphicsPushContext(ctx)

        let progress = self.presentation()?.progress ?? self.progress
        let clampedProgress = max(0.0, min(1.0, progress))
        var fillFrame = self.bounds
        fillFrame.size.width *= clampedProgress

        ctx.clear(self.bounds)
        ctx.setFillColor(color)
        ctx.fill(fillFrame)

        UIGraphicsPopContext()
    }
}
