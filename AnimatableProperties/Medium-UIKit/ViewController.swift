//
//  ViewController.swift
//  delete
//
//  Created by Jon Cardasis on 12/31/18.
//  Copyright © 2018 Jon Cardasis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let happinessMeter = GlobalHappinessProgressView() // GlobalHappinessBarView()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        happinessMeter.frame = CGRect(x: 50, y: 200, width: 300, height: 50)
        happinessMeter.progress = 0.0
        happinessMeter.color = UIColor.red.cgColor
        view.addSubview(happinessMeter)
        
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 50, y: 50, width: 100, height: 50)
        btn.setTitle("Animate!", for: .normal)
        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(btn)
        
        let btn2 = UIButton(type: .system)
        btn2.frame = CGRect(x: 150, y: 50, width: 100, height: 50)
        btn2.setTitle("Set!", for: .normal)
        btn2.addTarget(self, action: #selector(buttonTapped2), for: .touchUpInside)
        view.addSubview(btn2)
        
        self.view = view
    }
    
    var isExpanded: Bool = false
    
    @objc func buttonTapped() {
        let progress: CGFloat = isExpanded ? 0.0 : 0.65
        self.isExpanded = !self.isExpanded
        
        print("Setting to: \(progress)")
        UIView.animate(withDuration: 1.5, delay: 0.2, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.happinessMeter.progress = progress
        }, completion: nil)
    }
    
    @objc func buttonTapped2() {
        let progress: CGFloat = isExpanded ? 0.0 : 1.0
        self.isExpanded = !self.isExpanded
        
        print("Setting to: \(progress)")
        self.happinessMeter.progress = progress
    }
}

