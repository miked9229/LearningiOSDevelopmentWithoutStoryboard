//
//  HomeDataSourceController+NavBar.swift
//  CodingWithoutStoryboard
//
//  Created by Michael Doroff on 10/8/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import UIKit


extension HomeDataSourceController {
    

     func setUpNavBarItems() {
    
    
    setupLeftNavItems()
    setupRightNavItems()
    setupRemainingNavItems()
    
    
    
    
    }


    private func setupRemainingNavItems() {
    
    let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
    titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
    titleImageView.contentMode = .scaleAspectFit
    navigationItem.titleView = titleImageView
    
    
    
    
    navigationController?.navigationBar.isTranslucent = false
    navigationController?.navigationBar.backgroundColor = .white
    
    }

    private func setupLeftNavItems() {
    let followButton = UIButton(type: .system)
    followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
    followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    
    
    }


    private func setupRightNavItems() {
    
    let searchButton = UIButton(type: .system)
    searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
    searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
    
    
    
    let composeButton = UIButton(type: .system)
    composeButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
    composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
    
    
    navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton)]
    }
}