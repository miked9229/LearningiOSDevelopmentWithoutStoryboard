//
//  TweetCell.swift
//  CodingWithoutStoryboard
//
//  Created by Michael Doroff on 10/8/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
    
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
    
    
    }
    
    
}
