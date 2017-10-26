//
//  Homedatasource.swift
//  CodingWithoutStoryboard
//
//  Created by Michael Doroff on 9/26/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import Foundation
import LBTAComponents
import TRON
import SwiftyJSON

extension Collection where Iterator.Element == JSON {
    func decode<T: JSONDecodable>() throws -> [T] {
        return try map({try T(json: $0)})
    }
}



class HomeDatasource: Datasource, JSONDecodable {
    
    let users: [User]
    let tweets: [Tweet]
    
    required init(json: JSON) throws {
        print("ready to parse JSON: ", json)
        
        guard let userJSONarray = json["users"].array, let tweetsJsonArray = json["tweets"].array else {
            throw NSError(domain: "com.letsbuildthatapp", code: 1, userInfo: [NSLocalizedDescriptionKey: "Parsing JSON was not valid"])
        
        }
        
//        self.users = userJSONarray.map{User(json: $0)}
//        self.tweets = tweetsJsonArray.map({Tweet(json: $0)})
        self.users = try userJSONarray.decode()
        self.tweets = try tweetsJsonArray.decode()
        
        
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }

    
    override func numberOfItems(_ section: Int) -> Int {
       
        if section == 1 {
            return tweets.count
        }
        
        return users.count
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        
        if indexPath.section == 1 {
            return tweets[indexPath.row]
        }
        
        return users[indexPath.row]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
}


