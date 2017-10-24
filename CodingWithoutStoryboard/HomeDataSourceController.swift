//
//  HomeDataSourceController.swift
//  CodingWithoutStoryboard
//
//  Created by Michael Doroff on 9/24/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON


class HomeDataSourceController: DatasourceController {
    
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Apologies, something went wrong. Please try again later...."
        label.isHidden = true
        return label
    }()
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(errorMessageLabel)
    errorMessageLabel.fillSuperview()
    
    setUpNavBarItems()
        
        
    collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)

        
        Service.sharedInstance.fetchHomeFeed { (homeDataSource, err) in
            if let err = err {
                self.errorMessageLabel.isHidden = false
                print("HomeDatasourceController error fetching json: ", err)
                return
            }
            
            self.datasource = homeDataSource
        }
        
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        
        if let user = self.datasource?.item(indexPath) as? User {
            // lets get an estimation of the height of our cell based on user.bioText
       
           
            let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
            
            let size = CGSize(width: approximateWidthOfBioTextView, height: 900)
            
            let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
            
            let  estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
        
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 62)
        
        }
        
        return CGSize(width: view.frame.width, height: 200)
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        
        if section == 1 {
            return .zero
        }
        
        return CGSize(width: view.frame.width, height: 64)
    
    
    
    }
    

}

