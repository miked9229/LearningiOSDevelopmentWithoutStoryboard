//
//  HomeDataSourceController.swift
//  CodingWithoutStoryboard
//
//  Created by Michael Doroff on 9/24/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let words = ["user1", "user2", "user3"]

    override func numberOfItems(_ section: Int) -> Int {
        return words.count
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        return words[indexPath.row]
    }
}

class HomeDataSourceController: DatasourceController {
    override func viewDidLoad() {
       
        
    let homeDatasource = HomeDatasource()
    self.datasource = homeDatasource
        
    }
}
