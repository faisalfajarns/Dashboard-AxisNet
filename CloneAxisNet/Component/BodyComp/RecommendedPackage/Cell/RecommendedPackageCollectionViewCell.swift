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

    var containerPackageNameView : UIView = {
        let view = UIView()
//        view.backgroundColor = .red
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    var packageNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Package Name"
        label.numberOfLines = 2
        label.font = label.font.withSize(13)
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var containerDiscPriceView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return view
        
    }()
    
    var currencyDiscPriceLabel : UILabel = {
        let label = UILabel()
        label.text = "Rp"
        label.textColor = .white
        label.font = label.font.withSize(10)
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    var packagePriceLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Package Price"
        label.font = label.font.withSize(15)
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var packagePriceDiscLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = ""
        label.font = label.font.withSize(18)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var containerPriceView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return view
    }()
    
    var currencyPriceLabel : UILabel = {
        let label = UILabel()
        label.text = "Rp"
        label.textColor = .white
        label.font = label.font.withSize(10)
        label.font = UIFont.boldSystemFont(ofSize: 13)
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
        containerView.addSubview(containerPackageNameView)
        containerPackageNameView.addSubview(packageNameLabel)
        containerView.addSubview(containerDiscPriceView)
        containerDiscPriceView.addSubview(currencyDiscPriceLabel)
        containerDiscPriceView.addSubview(packagePriceDiscLabel)
        containerView.addSubview(containerPriceView)
        containerPriceView.addSubview(currencyPriceLabel)
        containerView.addSubview(packagePriceLabel)
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
            containerPackageNameView.topAnchor.constraint(equalTo: imagePlay.bottomAnchor, constant: 5),
            containerPackageNameView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            containerPackageNameView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            packageNameLabel.topAnchor.constraint(equalTo: containerPackageNameView.topAnchor),
            packageNameLabel.leadingAnchor.constraint(equalTo: containerPackageNameView.leadingAnchor),
            packageNameLabel.trailingAnchor.constraint(equalTo: containerPackageNameView.trailingAnchor),
            packageNameLabel.bottomAnchor.constraint(equalTo: containerPackageNameView.bottomAnchor),
            containerDiscPriceView.topAnchor.constraint(equalTo: containerPackageNameView.bottomAnchor, constant: 5),
            containerDiscPriceView.leadingAnchor.constraint(equalTo: containerPackageNameView.leadingAnchor),
            containerDiscPriceView.trailingAnchor.constraint(equalTo: containerPackageNameView.trailingAnchor),
            
            currencyDiscPriceLabel.topAnchor.constraint(equalTo: containerDiscPriceView.topAnchor),
            currencyDiscPriceLabel.leadingAnchor.constraint(equalTo: containerDiscPriceView.leadingAnchor),
            currencyDiscPriceLabel.trailingAnchor.constraint(equalTo: packagePriceDiscLabel.leadingAnchor, constant: -10),
            packagePriceDiscLabel.topAnchor.constraint(equalTo: currencyDiscPriceLabel.topAnchor),
            packagePriceDiscLabel.leadingAnchor.constraint(equalTo: currencyDiscPriceLabel.trailingAnchor),
            containerPriceView.topAnchor.constraint(equalTo: containerDiscPriceView.bottomAnchor, constant: 5 ),
            containerPriceView.leadingAnchor.constraint(equalTo: containerDiscPriceView.leadingAnchor),
            containerPriceView.trailingAnchor.constraint(equalTo: containerDiscPriceView.trailingAnchor),
            currencyPriceLabel.topAnchor.constraint(equalTo: containerPriceView.topAnchor),
            currencyPriceLabel.leadingAnchor.constraint(equalTo: containerPriceView.leadingAnchor),
           
            packagePriceLabel.leadingAnchor.constraint(equalTo: currencyPriceLabel.trailingAnchor, constant: 10),
            packagePriceLabel.topAnchor.constraint(equalTo: currencyPriceLabel.topAnchor),
            packageExpLabel.topAnchor.constraint(equalTo: containerPriceView.bottomAnchor, constant: 1),
            packageExpLabel.leadingAnchor.constraint(equalTo: containerPriceView.leadingAnchor),
            packageExpLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -2)
        ])
    }
}
