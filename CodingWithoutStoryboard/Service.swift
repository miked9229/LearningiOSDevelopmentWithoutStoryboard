//
//  Service.swift
//  CodingWithoutStoryboard
//
//  Created by Michael Doroff on 10/21/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON




struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let sharedInstance = Service()

    
    func fetchHomeFeed(completion: @escaping (HomeDatasource) -> ()) {
 
        let request: APIRequest<HomeDatasource, JSONError> = tron.request("/twitter/home")
        
        
        request.perform(withSuccess: { (homeDataSource) in
            
            
            completion(homeDataSource)
            
        }) { (err) in
            
        }
        
    }
    
    
    
    
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
        
    }
    
}
