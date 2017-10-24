//
//  TweetCell.swift
//  CodingWithoutStoryboard
//
//  Created by Michael Doroff on 10/8/17.
//  Copyright © 2017 Michael Doroff. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let tweet = datasourceItem as? Tweet else { return }
            
            
            profileImageView.loadImage(urlString: tweet.user.profileImageURL)
            
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16)])
            
            let usernameString = "  \(tweet.user.username)\n"
            
            attributedText.append(NSMutableAttributedString(string: usernameString, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName: UIColor.gray]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributedText.string.characters.count)
            attributedText.addAttributes([NSParagraphStyleAttributeName: paragraphStyle], range: range)
            
            attributedText.append(NSMutableAttributedString(string: tweet.message, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]))
            
            
            messageTextView.attributedText = attributedText
        }
    }
    
    
    let messageTextView: UITextView = {
        let tv = UITextView()
        tv.text = "Some sample text"
        tv.backgroundColor = .clear
        return tv
        
    }()
    
    
    let profileImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
        
    }()
    
    let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
        
        
    }()
    
    let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
        
        
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
        
        
    }()
    
    let directMessageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "send_message").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
        
        
    }()
    
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
    
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(profileImageView)
        addSubview(messageTextView)
        addSubview(replyButton)
    
    
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        messageTextView.anchor(self.topAnchor, left: profileImageView.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        setupBottomButtons()
        
    }
    
    public func setupBottomButtons() {
        
        
        let replyButtonContainerView = UIView()

        
        let retweetButtonContainerView = UIView()

        
        
        let likeButtonContainerView = UIView()
        
        let directMessageContainerView = UIView()

        
        
        
        let view = UIView()
        view.backgroundColor = .red
        
        let buttonStackView = UIStackView(arrangedSubviews: [replyButtonContainerView, retweetButtonContainerView, likeButtonContainerView, directMessageContainerView])
        
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        
        
        
        addSubview(buttonStackView)
        
        buttonStackView.anchor(nil, left: messageTextView.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 4, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
     
        addSubview(replyButton)
        addSubview(retweetButton)
        addSubview(likeButton)
        addSubview(directMessageButton)
        
        
        replyButton.anchor(replyButtonContainerView.topAnchor, left: replyButtonContainerView.leftAnchor , bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        retweetButton.anchor(retweetButtonContainerView.topAnchor, left: retweetButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        likeButton.anchor(likeButtonContainerView.topAnchor, left: likeButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        
        directMessageButton.anchor(directMessageContainerView.topAnchor, left: directMessageContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        
       
    }
    
    
}
