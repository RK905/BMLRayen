//
//  SkillViewController.swift
//  BMLRayen
//
//  Created by Rayen Kamta on 7/27/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//

import UIKit

class SkillViewController: UIViewController {
    
    var objcLabel: UILabel!
    var swiftLabel: UILabel!
    var sqlLabel: UILabel!
    var pythonLabel: UILabel!

    @IBOutlet weak var dismissButton: UIButton!
    
    @IBAction func dismissButtonAsAction(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addCircle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addCircle() {
        let circleWidth = CGFloat(self.view.frame.height / 4)
        let circleHeight = circleWidth
        
        let oneCircle = SkillLoaderView(frame: CGRect(x: 0 + 10, y: ((self.view.bounds.height / 2) - (circleHeight / 2)) - 50, width: circleWidth, height: circleHeight), start: 0, end: 95, interval: 0.09, completion: 0.95, color: UIColor(red: 23 / 255.0, green: 168 / 255.0, blue: (248 / 255.0), alpha: 1.0), title: "Obj - C")
        
        let twoCircle = SkillLoaderView(frame: CGRect(x: (self.view.bounds.width / 2) + 10, y: ((self.view.bounds.height / 2) - (circleHeight / 2)) - 50, width: circleWidth, height: circleHeight), start: 0, end: 85, interval: 0.05, completion: 0.85, color: UIColor.green, title: "Swift")
        
        let threeCircle = SkillLoaderView(frame: CGRect(x: 0 + 10, y: (self.view.bounds.height / 2) + (circleHeight / 2), width: circleWidth, height: circleHeight), start: 0, end: 75, interval: 0.0714, completion: 0.75, color: UIColor.yellow, title: "SQL")

        let fourCircle = SkillLoaderView(frame: CGRect(x: (self.view.bounds.width / 2) + 10, y: (self.view.bounds.height / 2) + (circleHeight / 2), width: circleWidth, height: circleHeight), start: 0, end: 80, interval: 0.0625, completion: 0.8, color: UIColor.cyan, title: "ios")
        
        view.addSubview(oneCircle)
        view.addSubview(twoCircle)
        view.addSubview(threeCircle)
        view.addSubview(fourCircle)
        
    }
    
    
}
