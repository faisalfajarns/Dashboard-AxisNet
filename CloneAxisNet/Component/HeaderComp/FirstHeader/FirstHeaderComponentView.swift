//
//  HeaderComponentView.swift
//  CloneAxisNet
//
//  Created by Batm on 17/06/22.
//

import UIKit

class FirstHeaderComponentView: UIView {
    
    var containerView : UIView = {
        let container = UIView()
        container.backgroundColor = UIColor.red
        container.translatesAutoresizingMaskIntoConstraints = false

        return container
    }()
    
    var containerLeadingLabelView : UIView = {
       let container = UIView()
        container.backgroundColor = UIColor.clear
        container.translatesAutoresizingMaskIntoConstraints = false
        
        return container
    }()
    
    var showAllLabel : UILabel = {
        let label = UILabel()
         label.text = "LIHAT SEMUA"
         label.textColor = .white
         label.translatesAutoresizingMaskIntoConstraints = false
         
         return label
    }()
    
    var userNameLabel : UILabel = {
       let label = UILabel()
        label.text = "Hi, AXISers"
        label.textColor = .white
        label.font = label.font.withSize(17)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        
       return label
    }()
    
    var pulsaLabel : UILabel = {
      let label = UILabel()
        label.text = "PULSA"
        label.font = label.font.withSize(14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var balanceLabel : UILabel = {
      let label = UILabel()
        label.text = "10000"
        label.textColor = .white
        label.font = label.font.withSize(18)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var expiredLabel : UILabel = {
      let label = UILabel()
        label.text = "10-10-2022"
        label.textColor = .white
        label.font = label.font.withSize(12)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var packageLabel : UILabel = {
      let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var imageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
    
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(containerView)
        containerView.addSubview(imageView)
        imageView.addSubview(containerLeadingLabelView)
        containerLeadingLabelView.addSubview(userNameLabel)
        containerLeadingLabelView.addSubview(pulsaLabel)
        containerLeadingLabelView.addSubview(balanceLabel)
        containerLeadingLabelView.addSubview(expiredLabel)
        containerLeadingLabelView.addSubview(packageLabel)
        imageView.addSubview(showAllLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            containerView.trailingAnchor.constraint(equalTo:self.trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            containerLeadingLabelView.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 50),
            containerLeadingLabelView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 20),
            containerLeadingLabelView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -180),
            containerLeadingLabelView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -50),
            userNameLabel.topAnchor.constraint(equalTo: containerLeadingLabelView.topAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: containerLeadingLabelView.leadingAnchor),
            pulsaLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10),
            pulsaLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            balanceLabel.topAnchor.constraint(equalTo: pulsaLabel.bottomAnchor),
            balanceLabel.leadingAnchor.constraint(equalTo: pulsaLabel.leadingAnchor),
            expiredLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor),
            expiredLabel.leadingAnchor.constraint(equalTo: balanceLabel.leadingAnchor),
            packageLabel.topAnchor.constraint(equalTo: expiredLabel.bottomAnchor, constant: 20),
            packageLabel.leadingAnchor.constraint(equalTo: expiredLabel.leadingAnchor),
            showAllLabel.leadingAnchor.constraint(equalTo: containerLeadingLabelView.trailingAnchor, constant: 45),
            showAllLabel.topAnchor.constraint(equalTo: containerLeadingLabelView.topAnchor, constant: 105)
            
        ])
            
         

    }
}
