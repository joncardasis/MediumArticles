import UIKit
import PlaygroundSupport


class ViewController: UIViewController {
    
    var styledButton: UIButton!
    
    fileprivate func animateButton(duration: CFTimeInterval = 1.0) {
        let oldValue = styledButton.frame.width/2
        let newButtonWidth: CGFloat = 60
        
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.65, -0.55, 0.27, 1.55)
        
        /* Do Animations */
        CATransaction.begin()
        CATransaction.setAnimationDuration(duration)
        CATransaction.setAnimationTimingFunction(timingFunction)

        // View animations
        UIView.animate(withDuration: duration) {
            self.styledButton.frame = CGRect(x: 0, y: 0, width: newButtonWidth, height: newButtonWidth)
            self.styledButton.center = self.view.center
        }
        
        // Layer animations
        let cornerAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius))
        cornerAnimation.fromValue = oldValue
        cornerAnimation.toValue = newButtonWidth/2
        
        styledButton.layer.cornerRadius = newButtonWidth/2
        styledButton.layer.add(cornerAnimation, forKey: #keyPath(CALayer.cornerRadius))
        
        CATransaction.commit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = CGRect(x:0, y:0, width: 600, height: 200)
        self.view.backgroundColor = .white
        
        styledButton = UIButton(frame: CGRect(x: 0, y: 0, width: 125, height: 125))
        styledButton.backgroundColor = UIColor(red: 57/255.0, green: 73/255.0, blue: 171/255.0, alpha: 1)
        styledButton.layer.cornerRadius = styledButton.frame.width/2
        styledButton.center = self.view.center
        
        self.view.addSubview(styledButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Call animation
        animateButton()
    }
}

let vc = ViewController()
PlaygroundPage.current.liveView = vc.view
