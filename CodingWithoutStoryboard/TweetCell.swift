//
//  TweetCell.swift
//  CodingWithoutStoryboard
//
//  Created by Michael Doroff on 10/8/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
        
    }()
    
    
    
    
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
    
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(profileImageView)
    
    
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        
    }
    
    
}
