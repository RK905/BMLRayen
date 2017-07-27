//
//  ToDoCellViewModel.swift
//  BMLRayen
//
//  Created by Rayen Kamta on 7/27/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//

import Foundation
import ReactiveJSON

class ToDoCellViewModel {
    let title: String
    let completed: Bool
    
    init?(withEntity e:Entity<Int>) {
        guard let title = e.attributes?.json["title"] as? String
            , let completed = e.attributes?.json["completed"] as? Bool
            else {
                return nil
        }
        
        self.title = title
        self.completed = completed
    }
    
    init?(withToDoModel p:ToDoModel?) {
        guard let title = p?.title
            , let completed = p?.completed
            else {
                return nil
        }
        
        self.title = title
        self.completed = completed
    }
    
}

