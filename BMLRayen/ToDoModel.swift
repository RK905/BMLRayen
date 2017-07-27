//
//  ToDoModel.swift
//  BMLRayen
//
//  Created by Rayen Kamta on 7/27/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//
import Foundation
import ReactiveJSON


class ToDoModel {
    
    var id: Int
    var userId: Int
    var title: String
    var completed: Bool
    
    init?(withEntity e:Entity<Int>) {
        guard let id = e.id
            , let userId = e.attributes?.json["userId"] as? Int
            , let title = e.attributes?.json["title"] as? String
            , let completed = e.attributes?.json["completed"] as? Bool
            else {
                return nil
        }
        
        self.id = id
        self.userId = userId
        self.title = title
        self.completed = completed
    }
    
}

