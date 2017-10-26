//
//  Tweet.swift
//  CodingWithoutStoryboard
//
//  Created by Michael Doroff on 10/12/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON

struct Tweet: JSONDecodable {
    let user: User
    let message: String
    
    
    
    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        

        self.message = json["message"].stringValue
        
    }
}
