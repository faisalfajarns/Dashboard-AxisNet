//
//  ForevelOnlineCollectionView.swift
//  CloneAxisNet
//
//  Created by Batm on 28/06/22.
//

import UIKit

class ForevelOnlineCollectionView: UICollectionView,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

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
        self.register(ForeverOnlineCollectionViewCell.self, forCellWithReuseIdentifier: ForeverOnlineCollectionViewCell.foreverOnlinePackageIdentifier)
        self.backgroundColor = UIColor.systemBackground
        self.delegate = self
        self.dataSource = self
       
        self.collectionViewLayout.collectionView?.showsHorizontalScrollIndicator = false
        self.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: 170).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let safecount = data {
            return safecount.count
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForeverOnlineCollectionViewCell.foreverOnlinePackageIdentifier, for: indexPath) as! ForeverOnlineCollectionViewCell
        
        if let safeimageicon = data {
            guard let safeimage = safeimageicon[indexPath.row].icon else {
                return cell
            }
            print("si::",safeimage)
            let urlImage1 = URL(string: safeimage)
            print("ui::", urlImage1)
            if let safeUrlImage1 = urlImage1 {
                print("su::", safeUrlImage1)
                do {
                    let data1 = try Data(contentsOf: safeUrlImage1)
                    print("dt1::", data1)
                   
                    cell.imageIcon.image = UIImage(data: data1)
                
                }catch(let error) {
                    print("err::", error.localizedDescription)
                }
            }

        }
            
        
        if let safepackagename = data {
            cell.packageNameLabel.text = safepackagename[indexPath.row].name
        }
        
        if let safevolume = data {
            cell.packageVolumeLabel.text = safevolume[indexPath.row].volume
        }
        
        if let safePrice = data {
    
            if safePrice[indexPath.row].price == safePrice[indexPath.row].price_disc || safePrice[indexPath.row].price_disc == 0 {
                guard let safeprice = safePrice[indexPath.row].price else{
                    return cell
                }
                let newPrice = String(describing: safeprice)
                cell.packagePriceDiscLabel.text = "\(newPrice.formatCurrency())"
                
            }else {
                //price
                guard let safeprice = safePrice[indexPath.row].price else {
                    return cell
                }
                let newPrice = String(describing: safeprice)
                let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "\(newPrice.formatCurrency())")
                        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
                    cell.packagePriceLabel.attributedText = attributeString
                
                
                //disc price
                guard let safediscprice = safePrice[indexPath.row].price_disc else {
                    return cell
                }
                let newDiscPrice = String(describing: safediscprice)
                cell.packagePriceDiscLabel.text = "\(newDiscPrice.formatCurrency())"
                
                if safediscprice == 0 {
                    cell.packagePriceDiscLabel.text = "Free"
                }else {
                    cell.packagePriceDiscLabel.text = "\(newDiscPrice.formatCurrency())"
                }
                
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
        return CGSize(width: (collectionView.frame.width/2)-10, height: 180)
    }


}
    

