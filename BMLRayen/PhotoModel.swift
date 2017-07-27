//
//  PhotoModel.swift
//  BMLRayen
//
//  Created by Rayen Kamta on 7/27/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//

import Foundation
import ReactiveJSON


class PhotoModel {
    
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String

    
    init?(withEntity e:Entity<Int>) {
        guard let id = e.id
            , let title = e.attributes?.json["title"] as? String
            , let url = e.attributes?.json["url"] as? String
            , let thumbnailUrl = e.attributes?.json["thumbnailUrl"] as? String
            else {
                return nil
        }
        
        self.id = id
        self.title = title
        self.url = url
        self.thumbnailUrl = thumbnailUrl
     
    }
    
}

