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
    
    required init(json: JSON) throws {
        print("ready to parse JSON: ", json)
        
        var users = [User]()
        
        let array = json["users"].array
        
        for userJson in array! {
            
            let name = userJson["name"].stringValue
            let username = userJson["username"].stringValue
            let bio = userJson["bio"].stringValue
            
            let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
            
            users.append(user)
        }
        
        self.users = users
        
    }
    



    let tweets: [Tweet] = {
        let brianUser = User(name: "Brian Voong", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Community. Join us to learn Swift, Objective-C and build iOS apps.", profileImage: #imageLiteral(resourceName: "profile_image"))
        
        let tweet1 = Tweet(user: brianUser, message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce nisi dui, ornare ac lobortis vitae, pharetra nec sapien. In volutpat ligula finibus, porta ante at, consequat mauris. In nec mollis lacus. Sed ac euismod arcu, eu eleifend erat. Mauris lacinia.")
        let tweet2 = Tweet(user: brianUser, message: "Curabitur scelerisque ante eu justo hendrerit, non vehicula justo scelerisque. Praesent molestie, odio nec sodales gravida, erat velit bibendum orci, ac porta mauris massa ut nisl. Aenean et lacus nunc. Maecenas nunc augue, facilisis eu pharetra et, ultricies vel arcu")
        return [tweet1, tweet2]
    }()
    
    
    
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


