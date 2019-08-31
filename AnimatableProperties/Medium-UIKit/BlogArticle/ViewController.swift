//
//  ViewController.swift
//  Medium-UIKit
//
//  Created by Jon Cardasis on 2/19/19.
//  Copyright © 2019 Jon Cardasis. All rights reserved.
//

import UIKit

private let defaultProgressTrackColor = UIColor.blue

class ViewController: UIViewController {

    private let progressView = ProgressView()
    
    private let animatePropertyButton = FancyButton(title: "Animate ✨")
    private let setPropertyButton = FancyButton(title: "Set")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        setupProgressView()
    }
    
    private func setupProgressView() {
        let height: CGFloat = 32.0
        
        progressView.backgroundColor = .lightGray
        progressView.layer.cornerRadius = height / 2.0
        progressView.layer.masksToBounds = true
        
        progressView.color = defaultProgressTrackColor
        progressView.progress = 0.0
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressView)
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            progressView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            progressView.heightAnchor.constraint(equalToConstant: height),
            progressView.topAnchor.constraint(equalTo: animatePropertyButton.bottomAnchor, constant: 64)
        ])
    }
    
    private func setupButtons() {
        let buttonSize = CGSize(width: 120, height: 40)
        let edgePadding: CGFloat = 50.0
        let topPadding: CGFloat = 100.0
        
        animatePropertyButton.addTarget(self, action: #selector(animatePressed), for: .touchUpInside)
        setPropertyButton.addTarget(self, action: #selector(setPressed(sender:)), for: .touchUpInside)
        
        animatePropertyButton.translatesAutoresizingMaskIntoConstraints = false
        setPropertyButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animatePropertyButton)
        view.addSubview(setPropertyButton)
        
        NSLayoutConstraint.activate([
            animatePropertyButton.widthAnchor.constraint(equalToConstant: buttonSize.width),
            animatePropertyButton.heightAnchor.constraint(equalToConstant: buttonSize.height),
            animatePropertyButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topPadding),
            animatePropertyButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: edgePadding),
            
            setPropertyButton.widthAnchor.constraint(equalToConstant: buttonSize.width),
            setPropertyButton.heightAnchor.constraint(equalToConstant: buttonSize.height),
            setPropertyButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topPadding),
            setPropertyButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -edgePadding)
        ])
    }
    
    @objc private func animatePressed() {
        // Reset
        progressView.progress = 0.0
        progressView.color = defaultProgressTrackColor
        
        // Animate the property inside an animation context
//        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
//            self.progressView.progress = 0.8
//            self.progressView.color = .red
//        }, completion: nil)
        UIView.animate(withDuration: 1.5, delay: 0, options: [.curveEaseInOut], animations: {
            self.progressView.progress = 0.8
            self.progressView.color = .red
        }, completion: nil)
    }
    
    @objc private func setPressed(sender: FancyButton) {
        let newProgress: CGFloat = progressView.progress > 0 ? 0.0 : 1.0
        
        // Set the value, reflecting immediately
        progressView.progress = newProgress
    }
}
