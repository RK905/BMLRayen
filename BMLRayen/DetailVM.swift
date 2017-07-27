//
//  DetailVM.swift
//  BMLRayen
//
//  Created by Rayen Kamta on 7/27/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//

import Foundation

class DetailVM {
    
    var title: String
    var url: Any

    init?(withPhoto p:PhotoCellVM?) {
        guard let title = p?.title
            , let url = p?.url
            
            else {
                return nil
        }
        
        self.title = title
        self.url = url
        
    }
    
    init?(withPost p:PostCellViewModel?) {
        guard let title = p?.title
            , let url = p?.body
            else {
                return nil
        }
        
        self.title = title
        self.url = url
    }

    init?(withToDo td:ToDoCellViewModel?) {
        guard let title = td?.title
            , let url = td?.completed
            else {
                return nil
        }
        
        self.title = title
        self.url = url
    }
    
    
    
}
