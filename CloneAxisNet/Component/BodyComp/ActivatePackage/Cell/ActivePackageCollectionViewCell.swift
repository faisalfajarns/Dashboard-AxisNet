//
//  ActivePackageCollectionViewCell.swift
//  CloneAxisNet
//
//  Created by Batm on 21/06/22.
//

import UIKit

class ActivePackageCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomActivePackageCollectionViewCell"
    
    var containerView : UIView = {
        let container = UIView()
        container.layer.cornerRadius = 10
        container.backgroundColor = .systemBackground
        container.layer.borderWidth = 1
        container.layer.borderColor = UIColor.lightGray.cgColor
        container.layer.shadowColor = UIColor.lightGray.cgColor
        container.layer.shadowOpacity = 1
        container.layer.shadowOffset = .zero
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    var containerTopLabel : UIView = {
        let container = UIView()
        container.backgroundColor = UIColor.clear
        container.translatesAutoresizingMaskIntoConstraints = false
        
        return container
    }()
    
    var containerBottomLabel : UIView = {
        let container = UIView()
        container.backgroundColor = UIColor.clear
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    var packageTitleLabel: UILabel = {
       let label = UILabel()
        label.text = "Title"
        label.textColor = .black
        label.backgroundColor = UIColor.clear
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var packageDetailLabel : UILabel = {
       let label = UILabel()
        label.text = "DETAIL"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var packageProgressBar : UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.progressViewStyle = .bar
//        progressBar.tintColor = .blue
        progressBar.progressTintColor = .systemOrange
        progressBar.trackTintColor = .lightGray
        progressBar.setProgress(0, animated: true)
        progressBar.clipsToBounds = true
        progressBar.layer.cornerRadius = 9
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()
    
    var restPackageLabel : UILabel = {
       let label = UILabel()
        label.text = "Sisa"
        label.textColor = .black
        label.font = label.font.withSize(14)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var expPackageLabel : UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.text = "Exp 10-10-10"
        label.font = label.font.withSize(13)
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(containerView)
        containerView.addSubview(containerTopLabel)
        containerTopLabel.addSubview(packageTitleLabel)
        containerTopLabel.addSubview(packageDetailLabel)
        containerView.addSubview(packageProgressBar)
        containerView.addSubview(containerBottomLabel)
        containerBottomLabel.addSubview(restPackageLabel)
        containerBottomLabel.addSubview(expPackageLabel)
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
        containerTopLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
        containerTopLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
        containerTopLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
        containerTopLabel.widthAnchor.constraint(equalToConstant:  containerView.frame.size.width),
        containerTopLabel.heightAnchor.constraint(equalToConstant: 25),
        packageTitleLabel.topAnchor.constraint(equalTo: containerTopLabel.topAnchor),
        packageTitleLabel.leadingAnchor.constraint(equalTo: containerTopLabel.leadingAnchor),

        packageDetailLabel.topAnchor.constraint(equalTo: packageTitleLabel.topAnchor),
        packageDetailLabel.trailingAnchor.constraint(equalTo: containerTopLabel.trailingAnchor),
        packageProgressBar.leadingAnchor.constraint(equalTo: containerTopLabel.leadingAnchor),
        packageProgressBar.trailingAnchor.constraint(equalTo: containerTopLabel.trailingAnchor),
        packageProgressBar.topAnchor.constraint(equalTo: containerTopLabel.bottomAnchor, constant: 20),
        packageProgressBar.heightAnchor.constraint(equalToConstant: 15),
        containerBottomLabel.topAnchor.constraint(equalTo: packageProgressBar.bottomAnchor, constant: 20),
        containerBottomLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
        containerBottomLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
        containerBottomLabel.widthAnchor.constraint(equalToConstant:  containerView.frame.size.width),
        containerBottomLabel.heightAnchor.constraint(equalToConstant: 25),
        restPackageLabel.topAnchor.constraint(equalTo: containerBottomLabel.topAnchor),
        restPackageLabel.leadingAnchor.constraint(equalTo: containerBottomLabel.leadingAnchor),
        restPackageLabel.topAnchor.constraint(equalTo: containerBottomLabel.topAnchor),
        expPackageLabel.topAnchor.constraint(equalTo: restPackageLabel.topAnchor),
        expPackageLabel.trailingAnchor.constraint(equalTo: containerBottomLabel.trailingAnchor),
                ])
    }
}
