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
        let brianUser = User(name: "TEST", username: "@ttesttesttest", bioText: "SOME MORE BIO TEXT")
        
        return [brianUser]
    
    
    }()
    
    
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
//    let words = ["user1", "user2", "user3"]
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.row]
    }
}


