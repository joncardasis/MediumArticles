//
//  FancyButton.swift
//  Medium-UIKit
//
//  Created by Jon Cardasis on 2/21/19.
//  Copyright © 2019 Jon Cardasis. All rights reserved.
//

import UIKit

private let defaultBackgroundColor = UIColor(red: 0.17, green: 0.58, blue: 0.91, alpha: 1.00)

/// A button whose purpose is to do nothing inordinate but look 𝐹𝒶𝓃𝒸𝓎.
class FancyButton: UIButton {
    
    convenience init(title: String) {
        self.init(type: .system)
        commonInit()
        setTitle(title, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Update shadow
        let shadowWidth = layer.bounds.width * 0.9
        let shadowRect = CGRect(x: 0 + (layer.bounds.width - shadowWidth) / 2.0, y: 0, width: shadowWidth, height: layer.bounds.height)
        layer.shadowPath = UIBezierPath(rect: shadowRect).cgPath
    }
    
    private func commonInit() {
        setupStyling()
        setupActions()
    }
    
    private func setupStyling() {
        backgroundColor = defaultBackgroundColor
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowRadius = 6.0
        layer.shadowOpacity = 0.3
        
        layer.zPosition = 2
        layer.cornerRadius = 8
    }
    
    private func setupActions() {
        addTarget(self, action: #selector(animateToPressedState), for: .touchDown)
        addTarget(self, action: #selector(animateToNormalState), for: .touchUpOutside)
        addTarget(self, action: #selector(animateToNormalState), for: .touchUpInside)
    }
    
    @objc private func animateToPressedState() {
        UIView.animate(withDuration: 0.05, animations: {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.92)
        }, completion: nil)
    }
    
    @objc private func animateToNormalState() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = .identity
        }, completion: nil)
    }
}
