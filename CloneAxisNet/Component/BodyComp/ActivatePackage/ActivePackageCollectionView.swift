//
//  ActivePackageCollectionView.swift
//  CloneAxisNet
//
//  Created by Batm on 21/06/22.
//

import UIKit

class ActivePackageCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var data : ActivePackageApi? {
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
    func setupView(){
        self.register(ActivePackageCollectionViewCell.self, forCellWithReuseIdentifier: ActivePackageCollectionViewCell.identifier)
        self.backgroundColor = UIColor.clear
        self.delegate = self
        self.dataSource = self
        
        self.collectionViewLayout.collectionView?.showsHorizontalScrollIndicator = false
        self.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let safedata = data {
            return safedata.result.detail?.count ?? 0
        }else{
            return 0
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActivePackageCollectionViewCell.identifier, for: indexPath) as! ActivePackageCollectionViewCell
        guard let safedata = data?.result.detail else {
            return cell
        }

        cell.packageTitleLabel.text = safedata[indexPath.row].name
        if let remainingQuota = safedata[indexPath.row].remaining {
            cell.restPackageLabel.text = "SISA \(remainingQuota)"
        }
        
        // Date Format For Cell
        // ------------- CodeReview - start ---------------
        // jangan di force cast ("!") kalo variable nya nil dia bakal crash //Done
        guard let str = safedata[indexPath.row].benefitData.activeUntil else {
            return cell
        }
        // ------------- CodeReview - end ---------------
        cell.expPackageLabel.text = "Berlaku Sampai \(str.formatDate())"
        //End Date Format For Cell
        
        //Calculate For Progress bar cell
        guard let safepercentage = safedata[indexPath.row].percentRemaining else{
            return cell
        }
        let calculate = Float(safepercentage)/100
        cell.packageProgressBar.setProgress(calculate, animated: true)
        //End Calculate Progress Bar
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        print("width::", collectionView.frame.width)
        return CGSize(width: collectionView.frame.width, height: 150)
    }

}
