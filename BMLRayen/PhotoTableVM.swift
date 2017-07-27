//
//  PhotoTableVM.swift
//  BMLRayen
//
//  Created by Rayen Kamta on 7/27/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result
import ReactiveJSON

class PhotoTableVM {
    
    
    var receivedData:[AnyObject] = []
    
    var isReloaded: MutableProperty<Bool>
    
    private var reloadSignal: (Signal<(), NoError>, Observer<(), NoError>)
    
    
    var signalReload: Signal<(), NoError> {
        return reloadSignal.0
    }
    
    
    
    init() {
        isReloaded = MutableProperty<Bool>(true)
        reloadSignal = Signal<(), NoError>.pipe()
    }
    
    
    
    func getPostCellViewModel(atIndex index: Int) -> PhotoCellVM? {
        if !receivedData.indices.contains(index) {
            return nil
        }
        
        let data = receivedData[index]
        let e:Entity<Int> = Entity<Int>(data as! [String:AnyObject])
        guard let photo: PhotoModel = PhotoModel(withEntity: e) else {
            return nil
        }
        return PhotoCellVM(withPhotoModel: photo)
        

    }
    
    
    func request() {
        
        let signalProducer:SignalProducer<Array<AnyObject>, NetworkError> = JSONPSPhoto.request(endpoint: "")
        
        signalProducer.on(starting: {
            self.isReloaded.value = false
        }, failed: { (error) in
            print("Error: \(error.description)")
            self.isReloaded.value = false
        }, completed: {
            self.isReloaded.value = true
            self.reloadSignal.1.send(value: ())
        }, interrupted: {
            self.isReloaded.value = false
        }) { (data) in
            self.receivedData = data
            }
            .start()
        
    }
    
}
