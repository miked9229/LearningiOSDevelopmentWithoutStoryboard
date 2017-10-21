//
//  Service.swift
//  CodingWithoutStoryboard
//
//  Created by Michael Doroff on 10/21/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import Foundation
import TRON




struct Service {
    
    let tron = TRON(baseURL: "")
    
    static let sharedInstance = Service()
    
    
    func fetchHomeFeed() {
        print("Fetching home feed")
        
    }
    
}
