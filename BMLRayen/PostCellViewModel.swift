//
//  PostCellViewModel.swift
//  BMLRayen
//
//  Created by Rayen Kamta on 7/27/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//

import Foundation
import ReactiveJSON

class PostCellViewModel {
    let title: String
    let body: String
    
    init?(withEntity e:Entity<Int>) {
        guard let title = e.attributes?.json["title"] as? String
            , let body = e.attributes?.json["body"] as? String
        else {
                return nil
        }
        
        self.title = title
        self.body = body
    }
    
    init?(withPostModel p:PostModel?) {
        guard let title = p?.title
            , let body = p?.body
        else {
                return nil
        }
        
        self.title = title
        self.body = body
    }
    
}

