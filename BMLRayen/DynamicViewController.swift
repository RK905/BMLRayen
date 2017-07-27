//
//  DynamicViewController.swift
//  BMLRayen
//
//  Created by Rayen Kamta on 7/27/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//

import UIKit
import CoreMotion

class DynamicViewController: UIViewController {
    
    let  coreMotionManager = CMMotionManager()
    
    @IBOutlet weak var dismissButton: UIButton!
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var pakrButton  = BallButton()
    var ipsmaButton = BallButton()
    var whampButton = BallButton()
    var alfaButton  = BallButton()
    
    lazy var animator: UIDynamicAnimator = {
        return UIDynamicAnimator(referenceView: self.view)
    }()
    
    lazy var gravity: UIGravityBehavior = {
        let lazyGravity = UIGravityBehavior()
        return lazyGravity
    }()
    
    lazy var collider: UICollisionBehavior = {
        let lazycollider = UICollisionBehavior()
        lazycollider.translatesReferenceBoundsIntoBoundary = true
        return lazycollider
    }()
    
    lazy var dynamicItemBehavior:UIDynamicItemBehavior = {
        let lazyBehavior = UIDynamicItemBehavior()
        
        
        lazyBehavior.elasticity = 1.0
        lazyBehavior.allowsRotation = true
        
        
        return lazyBehavior
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        drawButton()
        animateButton()
        
        pakrButton.addTarget(self, action: #selector(parkrAction), for: .touchUpInside)
        ipsmaButton.addTarget(self, action: #selector(ipsmaAction), for: .touchUpInside)
        whampButton.addTarget(self, action: #selector(whampAction), for: .touchUpInside)
        alfaButton.addTarget(self, action: #selector(alfaAction), for: .touchUpInside)
        
    
        pakrButton.setTitle("My iOS", for: .normal)
        pakrButton.titleLabel?.font = UIFont(name: "Avenir Next", size: 18)
        
        ipsmaButton.setTitle("My Fiverr", for: .normal)
        ipsmaButton.titleLabel?.font = UIFont(name: "Avenir Next", size: 18)
        
        whampButton.setTitle("My Android", for: .normal)
        whampButton.titleLabel?.font = UIFont(name: "Avenir Next", size: 18)
        
        alfaButton.setTitle("Linkedin", for: .normal)
        alfaButton.titleLabel?.font = UIFont(name: "Avenir Next", size: 18)
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func parkrAction() {
        let url = URL(string: "https://itunes.apple.com/us/developer/rayen-kamta/id798935537")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    func ipsmaAction() {
        let url = URL(string: "https://www.fiverr.com/geeksdobyte")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    func whampAction() {
        let url = URL(string: "https://play.google.com/store/apps/developer?id=Rayen%20Kamta&hl=en")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    func alfaAction() {
        let url = URL(string: "https://www.linkedin.com/in/rayenkamta/")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    func drawButton() {
        let buttons = [pakrButton, ipsmaButton, whampButton, alfaButton]
        let colors = [UIColor.blue, UIColor.orange, UIColor.red, UIColor.green]
        
        var count = 0
        
        for button in buttons {
            let buttonSize = CGSize(width: 120, height: 120)
            
            let x = CGFloat(arc4random() % 120) - 60
            let y = CGFloat(arc4random() % 120) - 60
            
            print(x, y)
            
            let centerPoint = CGPoint(x: self.view.bounds.midX - (buttonSize.width / 2) + x,
                                      y: self.view.bounds.midY - (buttonSize.height / 2) + y)
            let frame = CGRect(origin: centerPoint, size: buttonSize)
            
            button.frame = frame
            button.backgroundColor = colors[count]
            count += 1
            button.layer.cornerRadius = pakrButton.bounds.size.height / 2
            
            self.view.addSubview(button)
        }
        
        
    }
    
    func animateButton() {
        let behaviors = [gravity, collider, dynamicItemBehavior] as [Any]
        
        for behavior in behaviors {
            animator.addBehavior(behavior as! UIDynamicBehavior)
            (behavior as AnyObject).addItem(pakrButton)
            (behavior as AnyObject).addItem(ipsmaButton)
            (behavior as AnyObject).addItem(whampButton)
            (behavior as AnyObject).addItem(alfaButton)
            updateMotion()
        }
        
    }
    
    func updateMotion() {
        if coreMotionManager.isAccelerometerAvailable && !coreMotionManager.isAccelerometerActive {
            coreMotionManager.accelerometerUpdateInterval = 0.25
            coreMotionManager.startAccelerometerUpdates(to: OperationQueue.main, withHandler: { (data, error) in
                if self.gravity.dynamicAnimator != nil {
                    if var dx = data?.acceleration.x, var dy = data?.acceleration.y {
                        
                        switch UIDevice.current.orientation {
                        case .portrait:
                            dy = -dy
                        case .portraitUpsideDown:
                            break
                        case .landscapeRight:
                            swap(&dx, &dy)
                        case .landscapeLeft:
                            swap(&dx, &dy); dy = -dy
                        default:
                            dx = 0; dy = 0
                        }
                    self.gravity.gravityDirection = CGVector(dx: dx, dy: dy)
                    }
                } else {
                    self.coreMotionManager.stopAccelerometerUpdates()
                }
            })
        }
    }
    
}

class BallButton: UIButton {
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        return .ellipse
    }
}







