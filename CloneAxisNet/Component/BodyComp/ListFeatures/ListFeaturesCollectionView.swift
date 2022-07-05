//
//  ListFeaturesCollectionView.swift
//  CloneAxisNet
//
//  Created by Batm on 24/06/22.
//

import UIKit

class ListFeaturesCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var dataListFeatures : [String]? {
        didSet{
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layoutFlow = UICollectionViewFlowLayout()
        layoutFlow.scrollDirection = .horizontal
    
        super.init(frame: frame, collectionViewLayout: layoutFlow)
        
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        self.register(ListFeaturesCollectionViewCell.self, forCellWithReuseIdentifier: ListFeaturesCollectionViewCell.listFeaturesIdentifier)
        self.delegate = self
        self.dataSource = self
        self.collectionViewLayout.collectionView?.showsHorizontalScrollIndicator = false
        self.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: 130).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let safedata = dataListFeatures {
            return safedata.count
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListFeaturesCollectionViewCell.listFeaturesIdentifier, for: indexPath) as! ListFeaturesCollectionViewCell
        guard let safedata = dataListFeatures else {
            return cell
        }
        cell.nameFeatureLabel.text = safedata[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("width::", collectionView.frame.width)
        return CGSize(width: 100, height: 120)
    }

}
