//
//  PhotoVM.swift
//  BMLRayen
//
//  Created by Rayen Kamta on 7/27/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//

import Foundation
import ReactiveJSON

class PhotoCellVM {
    var title: String
    var thumbnailUrl: String
    
    init?(withEntity e:Entity<Int>) {
        guard let title = e.attributes?.json["title"] as? String
            , let thumbnailUrl = e.attributes?.json["thumbnailUrl"] as? String
            else {
                return nil
        }
        
        self.title = title
        self.thumbnailUrl = thumbnailUrl
    }
    
    init?(withPhotoModel p:PhotoModel?) {
        guard let title = p?.title
            , let thumbnailUrl = p?.thumbnailUrl
            else {
                return nil
        }
        
        self.title = title
        self.thumbnailUrl = thumbnailUrl
    }
    
}
