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
                
                if let apiError = err as? APIError<Service.JSONError> {
                    
                    if apiError.response?.statusCode != 200 {
                        self.errorMessageLabel.text = "Status code was not 200"
                        return
                    }
                    
                }
                
                
                
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
    
    if indexPath.section == 0 {
           
            if let user = self.datasource?.item(indexPath) as? User {
                // lets get an estimation of the height of our cell based on user.bioText
                
            let estimatedHeight = estimatedHeightForText(user.bioText)
                
            return CGSize(width: view.frame.width, height: estimatedHeight + 62)
                
        }

    } else if indexPath.section == 1 {
            
            guard let tweet = datasource?.item(indexPath) as? Tweet else {return .zero}
            
            let estimatedHeight = estimatedHeightForText(tweet.message)
            
            return CGSize(width: view.frame.width, height: estimatedHeight + 74)
            
        }
        
        
        
        return CGSize(width: view.frame.width, height: 200)
    
    }
    
    
    private func estimatedHeightForText(_ text: String) -> CGFloat {
    
        let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
        
        let size = CGSize(width: approximateWidthOfBioTextView, height: 900)
        
        let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
        
        let  estimatedFrame = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return estimatedFrame.height
        
    
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

