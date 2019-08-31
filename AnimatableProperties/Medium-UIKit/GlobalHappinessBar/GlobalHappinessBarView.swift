//
//  GlobalHappinessBarView.swift
//  GoodGood
//
//  Created by Jon Cardasis on 2/19/19.
//  Copyright © 2019 Jon Cardasis. All rights reserved.
//

import UIKit

class GlobalHappinessBarView: UIControl {
    
    /// The color of the progress bar.
    public var progressColor: UIColor = UIColor(hex: 0xF84864) {
        didSet {
            progressBarBackground.color = progressColor.cgColor
        }
    }
    
    /// The value of the progress bar. A float between [0.0, 1.0].
    public var progress: CGFloat = 0.0 {
        didSet {
            progressBarBackground.progress = progress
        }
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
        
        heartImageView.applyDropShadow(color: UIColor.black, opacity: 0.3, offset: CGSize(width: 0, height: 2), radius: 5)
        globeImageView.applyDropShadow(color: UIColor.black, opacity: 0.3, offset: CGSize(width: 0, height: 2), radius: 5)
        progressBarBackground.applyDropShadow(color: UIColor.black, opacity: 0.3, offset: CGSize(width: 0, height: 2), radius: 5)
        
        progressBarBackground.layer.borderWidth = progressBarBackground.layer.bounds.height * 0.1
    }
    
    // Private
    private var heartImageView: UIImageView!
    private var globeImageView: UIImageView!
    private var progressBarBackground: GlobalHappinessProgressView!
    
    private func commonInit() {
        setupHeartImageView()
        setupGlobeImageView()
        setupProgressBarBackground()
    }
    
    private func setupHeartImageView() {
        let heartImage = #imageLiteral(resourceName: "heart_fill")
        heartImageView = UIImageView(image: heartImage)
        heartImageView.contentMode = .scaleAspectFit
        
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(heartImageView)
        
        NSLayoutConstraint.activate([
            heartImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            heartImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            heartImageView.heightAnchor.constraint(equalTo: self.heightAnchor),
            heartImageView.widthAnchor.constraint(equalTo: heartImageView.heightAnchor)
            ])
    }
    
    private func setupGlobeImageView() {
        let globeImage = #imageLiteral(resourceName: "globe")
        globeImageView = UIImageView(image: globeImage)
        globeImageView.contentMode = .scaleAspectFit
        
        globeImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(globeImageView)
        
        NSLayoutConstraint.activate([
            globeImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            globeImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            globeImageView.heightAnchor.constraint(equalTo: self.heightAnchor),
            globeImageView.widthAnchor.constraint(equalTo: globeImageView.heightAnchor)
            ])
    }
    
    private func setupProgressBarBackground() {
        progressBarBackground = GlobalHappinessProgressView()
        progressBarBackground.backgroundColor = UIColor(hex: 0xD8D8D8).withAlphaComponent(0.52)
        progressBarBackground.layer.borderColor = UIColor.white.cgColor
        
        progressBarBackground.progress = progress
        progressBarBackground.color = progressColor.cgColor
        
        progressBarBackground.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(progressBarBackground, at: 0)
        
        NSLayoutConstraint.activate([
            progressBarBackground.leadingAnchor.constraint(equalTo: heartImageView.centerXAnchor),
            progressBarBackground.trailingAnchor.constraint(equalTo: globeImageView.centerXAnchor),
            progressBarBackground.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            progressBarBackground.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5)
            ])
    }
}
