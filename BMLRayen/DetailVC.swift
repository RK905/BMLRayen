//
//  DetailVC.swift
//  BMLRayen
//
//  Created by Rayen Kamta on 7/27/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fullImage : UIImageView!
    
    
    var viewModel: DetailVM?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if viewModel == nil {
            return
        }
        
        titleLabel.text = viewModel!.title
        fullImage.loadImageUsingCache(withUrl: viewModel!.url)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
