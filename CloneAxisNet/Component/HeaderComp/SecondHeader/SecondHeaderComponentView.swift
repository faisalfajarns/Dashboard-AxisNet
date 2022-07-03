//
//  SecondHeaderComponentView.swift
//  CloneAxisNet
//
//  Created by Batm on 01/07/22.
//

import UIKit

class SecondHeaderComponentView: UIView {

    var containerView : UIView = {
        let container = UIView()
        container.backgroundColor = UIColor.systemBackground
        container.translatesAutoresizingMaskIntoConstraints = false
        container.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return container
    }()
    
    var imageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
//        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    
    var userNameLabel : UILabel = {
       let label = UILabel()
        label.text = "Hi, AXISer"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(15)
       return label
    }()
    
    var balanceLabel : UILabel = {
      let label = UILabel()
        label.text = "10000"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(containerView)
        containerView.addSubview(imageView)
        imageView.addSubview(userNameLabel)
        imageView.addSubview(balanceLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
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
            userNameLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 50),
            userNameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 35),
            balanceLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 5),
            balanceLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor, constant: 5)
        ])
    }
}
