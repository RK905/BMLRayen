//
//  ViewController.swift
//  BMLRayen
//
//  Created by Rayen Kamta on 7/26/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//

import UIKit
import ReactiveJSON
import ReactiveSwift



struct GW2API: Singleton, ServiceHost {
    // 'Singleton'
    private(set) static var shared = Instance()
    typealias Instance = GW2API
    
    // 'ServiceHost'
    static var scheme: String { return "https" }
    static var host: String { return "api.guildwars2.com" }
    static var path: String? { return "v2" }
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GW2API.request(endpoint: "achievements/1")
            .startWithResult {
                print($0.value!)
        }
               
        let achievementsIDs = MutableProperty<[[String:AnyObject]]>([])
        achievementsIDs <~ GW2API
            .request(endpoint: "achievements/1")
            .ignoreError()
       
    

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

