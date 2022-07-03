//
//  RecommendedPackageCollectionViewCell.swift
//  CloneAxisNet
//
//  Created by Batm on 28/06/22.
//

import UIKit

class RecommendedPackageCollectionViewCell: UICollectionViewCell {
    static let recommendedPackageIdentifier = "CustomRecommendedPackageCollectionViewCell"
    
   
    
    var containerView : UIView = {
        let container = UIView()
        container.layer.cornerRadius = 10
        container.backgroundColor = UIColor.systemPurple
        container.layer.borderWidth = 1
        container.layer.borderColor = UIColor.lightGray.cgColor
        container.layer.shadowColor = UIColor.lightGray.cgColor
        container.layer.shadowOpacity = 1
        container.layer.shadowOffset = .zero
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    var imagePlay: UIImageView = {
       let image = UIImageView()
       image.image = UIImage(named: "playbutton")
       image.translatesAutoresizingMaskIntoConstraints = false
//        imageNews.backgroundColor = .none
//        imageNews.contentMode = .scaleToFill
        image.contentMode = .scaleToFill
        
       image.layer.cornerRadius = 10
        image.clipsToBounds = true
       return image
   }()

    
    var packageNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Package Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var packagePriceLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Package Price"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var packagePriceDiscLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var packageExpLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Package Exp"
        label.font = label.font.withSize(13)
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(containerView)
        containerView.addSubview(imagePlay)
        containerView.addSubview(packageNameLabel)
        containerView.addSubview(packagePriceLabel)
        containerView.addSubview(packagePriceDiscLabel)
        containerView.addSubview(packageExpLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imagePlay.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            imagePlay.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            imagePlay.widthAnchor.constraint(equalToConstant: 50),
            imagePlay.heightAnchor.constraint(equalToConstant: 50),
            packageNameLabel.topAnchor.constraint(equalTo: imagePlay.bottomAnchor, constant: 10),
            packageNameLabel.leadingAnchor.constraint(equalTo: imagePlay.leadingAnchor),
            packageNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
        
            packagePriceLabel.topAnchor.constraint(equalTo: packageNameLabel.bottomAnchor, constant: 10),
            packagePriceLabel.leadingAnchor.constraint(equalTo: packageNameLabel.leadingAnchor),
            packagePriceDiscLabel.topAnchor.constraint(equalTo: packagePriceLabel.bottomAnchor, constant: 3),
            packagePriceDiscLabel.leadingAnchor.constraint(equalTo: packagePriceLabel.leadingAnchor),
            packageExpLabel.topAnchor.constraint(equalTo: packagePriceDiscLabel.bottomAnchor, constant: 10),
            packageExpLabel.leadingAnchor.constraint(equalTo: packagePriceDiscLabel.leadingAnchor),
            packageExpLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            packageExpLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
    }
}
