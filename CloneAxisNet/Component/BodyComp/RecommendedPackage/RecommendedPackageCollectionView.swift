//
//  RecommendedPackageCollectionView.swift
//  CloneAxisNet
//
//  Created by Batm on 28/06/22.
//

import UIKit

class RecommendedPackageCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var data : [Packages]? {
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
        self.register(RecommendedPackageCollectionViewCell.self, forCellWithReuseIdentifier: RecommendedPackageCollectionViewCell.recommendedPackageIdentifier)
        self.backgroundColor = UIColor.systemBackground
        self.delegate = self
        self.dataSource = self
       
        self.collectionViewLayout.collectionView?.showsHorizontalScrollIndicator = false
        self.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: 210).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let safecount = data {
           return safecount.count
        }else {
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedPackageCollectionViewCell.recommendedPackageIdentifier, for: indexPath) as! RecommendedPackageCollectionViewCell
        if let safename = data {
            cell.packageNameLabel.text = safename[indexPath.row].name
        }
        
        if let safePrice = data {
            
            if safePrice[indexPath.row].price == safePrice[indexPath.row].price_disc {
                guard let safediscprice = safePrice[indexPath.row].price_disc else{
                    return cell
                }
                let newDiscPrice = String(describing: safediscprice)
                cell.packagePriceDiscLabel.text = newDiscPrice.formatCurrency()
               
                cell.packagePriceLabel.isHidden = true
                cell.currencyPriceLabel.isHidden = true
            } else {
                
                //disc price
                guard let safediscprice = safePrice[indexPath.row].price_disc else {
                    return cell
                }
                
                let newDiscPrice = String(describing: safediscprice)
                cell.packagePriceDiscLabel.text = newDiscPrice.formatCurrency()
                //end disc price
                
                
                //price
                guard let safeprice = safePrice[indexPath.row].price else {
                    return cell
                }
                let newPrice = String(describing: safeprice)
                let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: newPrice.formatCurrency())
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
                cell.packagePriceLabel.attributedText = attributeString

            }
    }
        
        
        
        if let safeExp = data {
            guard let safeexp = safeExp[indexPath.row].exp else {
                return cell
            }
            cell.packageExpLabel.text = "Masa aktif \(String(describing: safeexp)) hari"
        }
        
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2+15, height: 200)
    }

}
