//
//  ForeverOnlineCollectionViewCell.swift
//  CloneAxisNet
//
//  Created by Batm on 28/06/22.
//

import UIKit

class ForeverOnlineCollectionViewCell: UICollectionViewCell {
    static let foreverOnlinePackageIdentifier = "CustomForeverOnlinePackageCollectionViewCell"
    
    var containerView : UIView = {
        let container = UIView()
        container.layer.cornerRadius = 10
        container.backgroundColor = UIColor.systemBackground
//        container.layer.borderWidth = 1
//        container.layer.borderColor = UIColor.lightGray.cgColor
        container.layer.shadowColor = UIColor.lightGray.cgColor
        container.layer.shadowOpacity = 1
        container.layer.shadowOffset = .zero
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    var imageIcon: UIImageView = {
       let image = UIImageView()
       image.image = UIImage(named: "playbutton")
    
       image.translatesAutoresizingMaskIntoConstraints = false
//        imageNews.backgroundColor = .none
//        imageNews.contentMode = .scaleToFill
//        image.contentMode = .scaleToFill
        
//       image.layer.cornerRadius = 10
        image.clipsToBounds = true
       return image
   }()

    
    var packageNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Package Name"
        label.font = label.font.withSize(14)
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var packageVolumeLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Package volume"
        label.font = label.font.withSize(15)
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var containerDiscPriceView : UIView =  {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.systemBackground
        
        return view
    }()
    
    var containerPriceView : UIView =  {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.systemBackground
        
        return view
    }()

    
    var currencyLabel : UILabel = {
        let label = UILabel()
        label.textColor = .systemPurple
        label.text = "Rp"
        label.font = label.font.withSize(12)
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var packagePriceLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Package Price"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var packagePriceDiscLabel : UILabel = {
        let label = UILabel()
        label.textColor = .systemPurple
        label.text = ""
        label.font = label.font.withSize(20)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var packageExpLabel : UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.text = "Package Exp"
        label.font = label.font.withSize(15)

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(containerView)
//        containerView.addSubview(imageIcon)
        containerView.addSubview(packageNameLabel)
        containerView.addSubview(packageVolumeLabel)
        containerView.addSubview(containerDiscPriceView)
        containerDiscPriceView.addSubview(currencyLabel)
        containerDiscPriceView.addSubview(packagePriceDiscLabel)
//        containerView.addSubview(packagePriceDiscLabel)
//        containerView.addSubview(packagePriceLabel)
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
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            packageNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            packageNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            packageNameLabel.bottomAnchor.constraint(equalTo: packageVolumeLabel.topAnchor),
            packageVolumeLabel.topAnchor.constraint(equalTo: packageNameLabel.bottomAnchor, constant: 5),
            packageVolumeLabel.leadingAnchor.constraint(equalTo: packageNameLabel.leadingAnchor, constant: 10),
            containerDiscPriceView.topAnchor.constraint(equalTo: packageVolumeLabel.bottomAnchor, constant: 10),
            containerDiscPriceView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            containerDiscPriceView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            containerDiscPriceView.heightAnchor.constraint(equalToConstant: 30),
            currencyLabel.topAnchor.constraint(equalTo: containerDiscPriceView.topAnchor, constant: 5),
            currencyLabel.leadingAnchor.constraint(equalTo: containerDiscPriceView.leadingAnchor, constant: 5),
            currencyLabel.trailingAnchor.constraint(equalTo: packagePriceDiscLabel.leadingAnchor, constant: -5),
            packagePriceDiscLabel.topAnchor.constraint(equalTo: currencyLabel.topAnchor),
            packagePriceDiscLabel.leadingAnchor.constraint(equalTo: currencyLabel.trailingAnchor, constant: 5),
            packagePriceDiscLabel.bottomAnchor.constraint(equalTo: currencyLabel.bottomAnchor),
            packageExpLabel.topAnchor.constraint(equalTo: containerDiscPriceView.bottomAnchor, constant: 20),
            packageExpLabel.leadingAnchor.constraint(equalTo: containerDiscPriceView.leadingAnchor),
            packageExpLabel.trailingAnchor.constraint(equalTo: containerDiscPriceView.trailingAnchor),
            packageExpLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -40)
        ])
    }
}
