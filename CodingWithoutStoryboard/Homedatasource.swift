//
//  Homedatasource.swift
//  CodingWithoutStoryboard
//
//  Created by Michael Doroff on 9/26/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import Foundation
import LBTAComponents


class HomeDatasource: Datasource {
    
    
    let users: [User] = {
        let brianUser = User(name: "Brian Voong", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Community. Join us to learn Swift, Objective-C and build iOS apps.", profileImage: #imageLiteral(resourceName: "profile_image"))
        
        let rayUser = User(name: "Ray Wenderlich", username: "@rwenderlich", bioText:
            "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference:", profileImage: #imageLiteral(resourceName: "Ray_profile_image"))
        
        
        return [brianUser, rayUser]
    
    
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
            return 2
        }
        
        return users.count
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.row]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
}


