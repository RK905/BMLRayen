//
//  ToDoTableCell.swift
//  BMLRayen
//
//  Created by Rayen Kamta on 7/27/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//

import UIKit

class ToDoTableCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var completedImage: UIImageView!
    
    
    var viewModel: ToDoCellViewModel? {
        didSet {
            if viewModel == nil {
                return
            }
            titleLabel.text = viewModel!.title
            completedImage.image = viewModel!.completed ? UIImage(named: "star") : UIImage(named: "redx")
        }
    }
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
