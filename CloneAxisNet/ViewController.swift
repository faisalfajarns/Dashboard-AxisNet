//
//  ViewController.swift
//  CloneAxisNet
//
//  Created by Batm on 16/06/22.
//

import UIKit
import RxSwift
import FirebaseRemoteConfig

class ViewController: UIViewController, UIScrollViewDelegate {
    var assetServices = AssetServices()
    var balanceServices = BalanceServices()
    var activePackageServices = ActivePackageServices()
    var listFeaturesServices = ListFeaturesServices()
    var recommendedPackageServices = RecommendedPackageServices()
    
    private var showSecondHeader = false
    private var lastContentOffset: CGFloat = 0
    public var backgroundImageData1: String = ""
    public var backgroundImageData2 : String = ""
    
    var scrollView : UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.backgroundColor = .systemBackground
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    let scrollViewContainer: UIStackView = {
         let view = UIStackView()
    
         view.axis = .vertical
         view.spacing = 10
  

         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()
    
    var firstHeaderComp : FirstHeaderComponentView = {
       let header = FirstHeaderComponentView()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.backgroundColor = .purple
        header.isHidden = false
       return header
    }()
    
    var secondHeaderComp : SecondHeaderComponentView = {
        let header = SecondHeaderComponentView()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.isHidden = true
        return header
    }()
    
    lazy var activePackageCollectionView : ActivePackageCollectionView = {
        let packageList = ActivePackageCollectionView()
        packageList.translatesAutoresizingMaskIntoConstraints = false
        return packageList
    }()
    
    lazy var listFeaturesCollectionView : ListFeaturesCollectionView = {
        let listFeatures = ListFeaturesCollectionView()
      
        listFeatures.translatesAutoresizingMaskIntoConstraints = false
        return listFeatures
    }()
    
    lazy var recommendedPackageCollectionView : RecommendedPackageCollectionView = {
        let recommendedPackage = RecommendedPackageCollectionView()
        
        recommendedPackage.translatesAutoresizingMaskIntoConstraints = false
        return recommendedPackage
    }()
    
    lazy var foreverOnlinePackageCollectionView : ForevelOnlineCollectionView = {
        let foreverOnlinePackage = ForevelOnlineCollectionView()
        foreverOnlinePackage.translatesAutoresizingMaskIntoConstraints = false
        return foreverOnlinePackage
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.addSubview(scrollView)
        view.addSubview(secondHeaderComp) //second header
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(firstHeaderComp)
        scrollViewContainer.addArrangedSubview(activePackageCollectionView)
        scrollViewContainer.addArrangedSubview(listFeaturesCollectionView)
        scrollViewContainer.addArrangedSubview(recommendedPackageCollectionView)
        scrollViewContainer.addArrangedSubview(foreverOnlinePackageCollectionView)
        
//        scrollViewContainer.addArrangedSubview(secondHeaderComp)
        
        fetchAssetForViewController()
        fetchBalanceForViewController()
        fetcActivePackageForViewController()
        fetchListFeaturesForViewController()
        fetchRecommendedPackage()
        setupLayout()
        scrollView.delegate = self
    }
  
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 46.0{
       
            secondHeaderComp.isHidden = true
//            firstHeaderComp.isHidden = false
     
             }
        else if scrollView.contentOffset.y >= 46.0{
                 
       
                 secondHeaderComp.isHidden = false
//                firstHeaderComp.isHidden = true
             }

    }


    func setupLayout(){
        NSLayoutConstraint.activate([
            secondHeaderComp.topAnchor.constraint(equalTo: view.topAnchor, constant: -10),
            secondHeaderComp.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secondHeaderComp.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            secondHeaderComp.heightAnchor.constraint(equalToConstant: 100),
            secondHeaderComp.widthAnchor.constraint(equalToConstant: scrollViewContainer.frame.size.width),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//                     this is important for scrolling
            scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            firstHeaderComp.heightAnchor.constraint(equalToConstant: 260),
            firstHeaderComp.widthAnchor.constraint(equalToConstant:scrollViewContainer.frame.size.width),
            firstHeaderComp.topAnchor.constraint(equalTo: scrollViewContainer.topAnchor, constant: -50),
            activePackageCollectionView.topAnchor.constraint(equalTo: firstHeaderComp.bottomAnchor, constant: -80),
            activePackageCollectionView.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor),
            activePackageCollectionView.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor),
            listFeaturesCollectionView.topAnchor.constraint(equalTo: activePackageCollectionView.bottomAnchor, constant: -10),
            listFeaturesCollectionView.leadingAnchor.constraint(equalTo: activePackageCollectionView.leadingAnchor),
            listFeaturesCollectionView.trailingAnchor.constraint(equalTo: activePackageCollectionView.trailingAnchor),
            recommendedPackageCollectionView.topAnchor.constraint(equalTo: listFeaturesCollectionView.bottomAnchor, constant: 10),
            recommendedPackageCollectionView.leadingAnchor.constraint(equalTo: listFeaturesCollectionView.leadingAnchor),
            recommendedPackageCollectionView.trailingAnchor.constraint(equalTo: listFeaturesCollectionView.trailingAnchor),
            foreverOnlinePackageCollectionView.topAnchor.constraint(equalTo: recommendedPackageCollectionView.bottomAnchor, constant: 10),
            foreverOnlinePackageCollectionView.leadingAnchor.constraint(equalTo: recommendedPackageCollectionView.leadingAnchor),
            foreverOnlinePackageCollectionView.trailingAnchor.constraint(equalTo: recommendedPackageCollectionView.trailingAnchor),
            
//            secondHeaderComp.topAnchor.constraint(equalTo: foreverOnlinePackageCollectionView.bottomAnchor, constant: 20),
//            secondHeaderComp.leadingAnchor.constraint(equalTo: foreverOnlinePackageCollectionView.leadingAnchor),
//            secondHeaderComp.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor)
        ])
    }
    
    func fetchAssetForViewController(){
        assetServices.fetchAssetData()
        assetServices.assetData
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
            .subscribe(onNext: {[weak self] (assetResponse) in
                self?.backgroundImageData1 = assetResponse.ui[0].value ?? ""
                self?.backgroundImageData2 = assetResponse.ui[1].value ?? ""
                
                DispatchQueue.main.async {
                    self!.setBgImage(url : self?.backgroundImageData2 ?? "")
                    self!.setBgImage2(url: self?.backgroundImageData1 ?? "")
                }
            })
    }
    
    func fetchBalanceForViewController(){
        balanceServices.fetchBalanceData()
        balanceServices.balanceData
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
            .subscribe(onNext: {[weak self] (balanceResponse) in
                DispatchQueue.main.async {
                    self!.setCurrencyFormatter(balance: balanceResponse.result.balance ?? "0")
                    self!.setDateFormatter(date: balanceResponse.result.activestopdate ?? "-")
                }
            })
    }
    
    func fetcActivePackageForViewController(){
        activePackageServices.fetchActivePackageData()
        activePackageServices.activePackageData
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
            .subscribe(onNext: {[weak self] (activePackageResponse) in
//                print("active::",activePackageResponse)
                self?.activePackageCollectionView.data = activePackageResponse
                DispatchQueue.main.async {
                    guard let safedata = activePackageResponse.result.summary?.activePackage else {
                        return
                    }
                    self?.firstHeaderComp.packageLabel.text = "PAKET SAAT INI (\(String(describing: safedata)))"
                }
            })
    }
    
    func fetchListFeaturesForViewController(){
        listFeaturesServices.fetchListFeaturesData()
        listFeaturesServices.listFeaturesData
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
            .subscribe(onNext: {[weak self] (listFeatureResponse) in
                self?.listFeaturesCollectionView.dataListFeatures = listFeatureResponse.listFeatures
            })
    }
    
    func fetchRecommendedPackage(){
        recommendedPackageServices.fetchRecommendedPackageData()
        recommendedPackageServices.recommendedPackageData
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
            .subscribe(onNext : {[weak self] (recommendedPackageResponse) in
//                print("RP::", recommendedPackageResponse)
                
                let recommendedData = recommendedPackageResponse.categories.filter { Categories in
                    Categories.sort == 1
                }
                self?.recommendedPackageCollectionView.data = recommendedData[0].packages
//                print("rd::", recommendedData[0])
                
                let foreverOnlineData = recommendedPackageResponse.categories.filter { Categories in
                    Categories.sort == 2
                }
                self?.foreverOnlinePackageCollectionView.data = foreverOnlineData[0].packages
            })
    }
    
    func setBgImage(url : String){
        let urlImage1 = URL(string: url)
        if let safeUrlImag1 = urlImage1 {
            let data1 = try? Data(contentsOf: safeUrlImag1)
            if let safedata1 = data1 {
                firstHeaderComp.imageView.image = UIImage(data: safedata1)
            }
            
        }
    }
    
    func setBgImage2(url : String){
        let urlImage1 = URL(string: url)
        if let safeUrlImag1 = urlImage1 {
            let data1 = try? Data(contentsOf: safeUrlImag1)
            if let safedata1 = data1 {
                secondHeaderComp.imageView.image = UIImage(data: safedata1)
            }
            
        }
    }
    
    func setCurrencyFormatter(balance : String){
        print(balance)
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        if let formatterBalance = formatter.string(from: Double(balance)! as NSNumber){
            firstHeaderComp.balanceLabel.text = "Rp. \(formatterBalance)"
        }
    }
    
    func setDateFormatter(date : String){
        firstHeaderComp.expiredLabel.text = date
    }
  
}

