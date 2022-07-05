//
//  ListFeaturesCollectionViewCell.swift
//  CloneAxisNet
//
//  Created by Batm on 24/06/22.
//

import UIKit

class ListFeaturesCollectionViewCell: UICollectionViewCell {
   static let listFeaturesIdentifier = "CustomListFeaturesCollectionViewCell"
    
    let containerView : UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.borderWidth = 1
        container.layer.borderColor = UIColor.lightGray.cgColor
        container.layer.shadowColor = UIColor.lightGray.cgColor
        container.layer.shadowOpacity = 1
        container.layer.shadowOffset = .zero
        container.layer.cornerRadius = 10
//        container.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return container
    }()
    
    let containerNameFeatureLabel : UIView = {
        let container = UIView()
        container.backgroundColor = UIColor.clear
        container.heightAnchor.constraint(equalToConstant: 35).isActive = true
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let nameFeatureLabel : UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.textColor = .black
        label.numberOfLines = 2
        label.font = label.font.withSize(14)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(containerView)
        contentView.addSubview(containerNameFeatureLabel)
        containerNameFeatureLabel.addSubview(nameFeatureLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerNameFeatureLabel.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            containerNameFeatureLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            containerNameFeatureLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            containerNameFeatureLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            nameFeatureLabel.topAnchor.constraint(equalTo: containerNameFeatureLabel.topAnchor),
            nameFeatureLabel.leadingAnchor.constraint(equalTo: containerNameFeatureLabel.leadingAnchor),
            nameFeatureLabel.trailingAnchor.constraint(equalTo: containerNameFeatureLabel.trailingAnchor),
            nameFeatureLabel.bottomAnchor.constraint(equalTo: containerNameFeatureLabel.bottomAnchor)
        
            
        ])
    }
}
