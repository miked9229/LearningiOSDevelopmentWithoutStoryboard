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


class HomeDatasource: Datasource, JSONDecodable {
    
    let users: [User]
    let tweets: [Tweet]
    
    
    
    required init(json: JSON) throws {
        print("ready to parse JSON: ", json)
        
        var users = [User]()
        
        let array = json["users"].array
        
        for userJson in array! {
            
//            let user = userJson["user"]
            
            let user = User(json: userJson)
            
            
            users.append(user)
        }
        
        
        var tweets = [Tweet]()
        
        let tweetsJsonArray = json["tweets"].array
        
        for tweetJson in tweetsJsonArray! {
            
            let user = tweetJson["user"]
            
            let userJSON = User(json: user)
            

            let message = tweetJson["message"].stringValue
            
            let tweet = Tweet(user: userJSON, message: message)
            
            tweets.append(tweet)
        
        
        }
        
        self.users = users
        self.tweets = tweets
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


