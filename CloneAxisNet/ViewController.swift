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
    
    private let disposeBag: DisposeBag = DisposeBag()
    private var showSecondHeader = false
    private var lastContentOffset: CGFloat = 0
    public var backgroundImageData1: String = ""
    public var backgroundImageData2 : String = ""
    public var imageData : [Ui] = []
    
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
    
    lazy var headerTitleRecommendedPackageLabel : UILabel = {
        let label = UILabel()
        label.textColor = .purple
        label.text = "Hanya Untukmu"
        label.font = label.font.withSize(18)
        label.font = UIFont.boldSystemFont(ofSize: 18)
   
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var recommendedPackageCollectionView : RecommendedPackageCollectionView = {
        let recommendedPackage = RecommendedPackageCollectionView()
        
        recommendedPackage.translatesAutoresizingMaskIntoConstraints = false
        return recommendedPackage
    }()
    
    var headerTitleForeverOnlineLabel : UILabel = {
        let label = UILabel()
        label.text = "Forever Online"
        label.textColor = .purple
        label.font = label.font.withSize(18)
        label.font = UIFont.boldSystemFont(ofSize: 18)
     
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        scrollViewContainer.addArrangedSubview(headerTitleRecommendedPackageLabel)
        scrollViewContainer.addArrangedSubview(recommendedPackageCollectionView)
        scrollViewContainer.addArrangedSubview(headerTitleForeverOnlineLabel)
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
            activePackageCollectionView.bottomAnchor.constraint(equalTo: listFeaturesCollectionView.topAnchor, constant: -10),
            listFeaturesCollectionView.topAnchor.constraint(equalTo: activePackageCollectionView.bottomAnchor, constant: -10),
            listFeaturesCollectionView.leadingAnchor.constraint(equalTo: activePackageCollectionView.leadingAnchor),
            listFeaturesCollectionView.trailingAnchor.constraint(equalTo: activePackageCollectionView.trailingAnchor),
            listFeaturesCollectionView.bottomAnchor.constraint(equalTo: headerTitleRecommendedPackageLabel.topAnchor, constant: -10),
            
            headerTitleRecommendedPackageLabel.topAnchor.constraint(equalTo: listFeaturesCollectionView.bottomAnchor, constant: 30 ),
            headerTitleRecommendedPackageLabel.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor, constant: 10),
            headerTitleRecommendedPackageLabel.bottomAnchor.constraint(equalTo: recommendedPackageCollectionView.topAnchor, constant: -10),
            recommendedPackageCollectionView.topAnchor.constraint(equalTo: headerTitleRecommendedPackageLabel.bottomAnchor, constant: 10),
            recommendedPackageCollectionView.leadingAnchor.constraint(equalTo: headerTitleRecommendedPackageLabel.leadingAnchor),
            recommendedPackageCollectionView.trailingAnchor.constraint(equalTo: listFeaturesCollectionView.trailingAnchor),
            recommendedPackageCollectionView.bottomAnchor.constraint(equalTo: headerTitleForeverOnlineLabel.topAnchor, constant: -20),
            headerTitleForeverOnlineLabel.topAnchor.constraint(equalTo: recommendedPackageCollectionView.bottomAnchor, constant: 20),
            headerTitleForeverOnlineLabel.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor, constant: 10),
            headerTitleForeverOnlineLabel.bottomAnchor.constraint(equalTo: foreverOnlinePackageCollectionView.topAnchor, constant: -10),
            foreverOnlinePackageCollectionView.topAnchor.constraint(equalTo: headerTitleForeverOnlineLabel.bottomAnchor, constant: 10),
            foreverOnlinePackageCollectionView.leadingAnchor.constraint(equalTo: recommendedPackageCollectionView.leadingAnchor),
            foreverOnlinePackageCollectionView.trailingAnchor.constraint(equalTo: recommendedPackageCollectionView.trailingAnchor),
        ])
    }
    
    // ------------- CodeReview - start ---------------
    // tambahin .disposed(by: disposeBag) di akhir fungsi, biar si variable di dispose habis di subscribe. Tambahin di semua func observable yg lain ya //Done
    // hindarin force casting ("!") rawan crash //Done
    func fetchAssetForViewController(){
        assetServices.fetchAssetData()
        assetServices.assetData
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
            .subscribe(onNext: {[weak self] (assetResponse) in
                self?.backgroundImageData1 = assetResponse.ui[0].value ?? ""
                self?.backgroundImageData2 = assetResponse.ui[1].value ?? ""
                
                var imageBackground = ""
                var imageHeaderScroll = ""
                
                assetResponse.ui.map { asset in
                    guard let safeurl = asset.value else {
                        return
                    }
                    if asset.name == "header-scroll-bg"{
                        imageHeaderScroll = safeurl
                    }else if asset.name == "home-bg" {
                        imageBackground = safeurl
                    }
                }
                //Yang ini mas
                self?.imageData = assetResponse.ui
                
                DispatchQueue.main.async {
                    self?.firstHeaderComp.imageView.setBgImage(url: imageBackground)
                    self?.secondHeaderComp.imageView.setBgImage(url: imageHeaderScroll)
                }
            }).disposed(by: disposeBag)
    }
    // ------------- CodeReview - end ---------------
    
    func fetchBalanceForViewController(){
        balanceServices.fetchBalanceData()
        balanceServices.balanceData
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
            .subscribe(onNext: {[weak self] (balanceResponse) in
                DispatchQueue.main.async {
                    self!.setCurrencyFormatter(balance: balanceResponse.result.balance ?? "0")
                    self!.setDateFormatter(date: balanceResponse.result.activestopdate ?? "-")
                }
            }).disposed(by: disposeBag)
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
            }).disposed(by: disposeBag)
    }
    
    func fetchListFeaturesForViewController(){
        listFeaturesServices.fetchListFeaturesData()
        listFeaturesServices.listFeaturesData
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
            .subscribe(onNext: {[weak self] (listFeatureResponse) in
                self?.listFeaturesCollectionView.dataListFeatures = listFeatureResponse.listFeatures
            }).disposed(by: disposeBag)
    }
    
    func fetchRecommendedPackage(){
        recommendedPackageServices.fetchRecommendedPackageData()
        recommendedPackageServices.recommendedPackageData
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
            .subscribe(onNext : {[weak self] (recommendedPackageResponse) in
                let recommendedData = recommendedPackageResponse.categories.filter { Categories in
                    Categories.sort == 1
                }
                self?.recommendedPackageCollectionView.data = recommendedData[0].packages
                
                let foreverOnlineData = recommendedPackageResponse.categories.filter { Categories in
                    Categories.sort == 2
                }
                self?.foreverOnlinePackageCollectionView.data = foreverOnlineData[0].packages
            }).disposed(by: disposeBag)
    }
    
    // ------------- CodeReview - start ---------------
    // ini ada 2 function yg sama, mending jadiin satu aja //Done

//    func setBgImage2(url : String){
//        print("url1::", url)
//        let urlImage1 = URL(string: url)
//        if let safeUrlImag1 = urlImage1 {
//            let data1 = try? Data(contentsOf: safeUrlImag1)
//            if let safedata1 = data1 {
//                secondHeaderComp.imageView.image = UIImage(data: safedata1)
//            }
//
//        }
//    }
    
//    func setBackgroundImage(data : [Ui]) {
//        data.map { image in
//            if image.name == "header-scroll-bg" {
//                guard let safeNewImage2 = image.value else {
//                    return
//                }
//                let newImage2 = URL(string: safeNewImage2)
//                if let safeUrlImage2 = newImage2 {
//                            let data2 = try? Data(contentsOf: safeUrlImage2)
//                            if let safedata2 = data2 {
//                                secondHeaderComp.imageView.image = UIImage(data: safedata2)
//                            }
//
//                        }
//            }else if image.name == "home-bg" {
//                guard let safeNewImage1 = image.value else {
//                    return
//                }
//                let newImage1 = URL(string: safeNewImage1)
//                if let safeUrlImage1 = newImage1 {
//                            let data1 = try? Data(contentsOf: safeUrlImage1)
//                            if let safedata1 = data1 {
//                                firstHeaderComp.imageView.image = UIImage(data: safedata1)
//                            }
//
//                        }
//            }
//        }
//    }
    // ------------- CodeReview - end ---------------
    
    
    // ------------- CodeReview - start ---------------
    // 2 function ini mending dijadiin extension string aja, nanti bikin class Utils, taro extension string disana
    // hindarin force casting, better handle pake iflet atau guardlet
    func setCurrencyFormatter(balance : String){
            firstHeaderComp.balanceLabel.text = "Rp. \(balance.formatCurrency())"
            secondHeaderComp.balanceLabel.text = "Rp. \(balance.formatCurrency())"
    }
    
    func setDateFormatter(date : String){
        firstHeaderComp.expiredLabel.text = date
    }
    // ------------- CodeReview - end ---------------
}

