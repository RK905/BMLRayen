//
//  ApiService.swift
//  BMLRayen
//
//  Created by Rayen Kamta on 7/27/17.
//  Copyright © 2017 Rayen Kamta. All rights reserved.
//


import ReactiveJSON
import ReactiveSwift

struct JSONPSPhoto : Singleton, ServiceHost {
    
    fileprivate(set) static var shared = Instance()
    typealias Instance = JSONPSPhoto
    
    static var scheme: String { return "https" }
    static var host: String { return "jsonplaceholder.typicode.com" }
    static var path: String? { return "photos" }
    
}

struct JSONPlaceholderToDoService : Singleton, ServiceHost {
    
    fileprivate(set) static var shared = Instance()
    typealias Instance = JSONPlaceholderToDoService
    
    static var scheme: String { return "https" }
    static var host: String { return "jsonplaceholder.typicode.com" }
    static var path: String? { return "todos" }
    
}

struct JSONPlaceholderPostService : Singleton, ServiceHost {
    
    fileprivate(set) static var shared = Instance()
    typealias Instance = JSONPlaceholderPostService
    
    static var scheme: String { return "https" }
    static var host: String { return "jsonplaceholder.typicode.com" }
    static var path: String? { return "posts" }
    
}
