//
//  HomeDataSourceController.swift
//  CodingWithoutStoryboard
//
//  Created by Michael Doroff on 9/24/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import LBTAComponents



class UserCell: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .yellow
        
    }
}



class HomeDatasource: Datasource {
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
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
    super.viewDidLoad()
        
    let homeDatasource = HomeDatasource()
    self.datasource = homeDatasource
        
    }
}
