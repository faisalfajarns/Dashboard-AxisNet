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
        container.backgroundColor = .red
        container.translatesAutoresizingMaskIntoConstraints = false
        
        return container
    }()
    
    let nameFeatureLabel : UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(containerView)
        contentView.addSubview(nameFeatureLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            nameFeatureLabel.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 5),
            nameFeatureLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            nameFeatureLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
    }
}
