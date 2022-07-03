//
//  ListFeaturesServices.swift
//  CloneAxisNet
//
//  Created by Batm on 26/06/22.
//

import Foundation
import RxCocoa
import RxSwift

import Firebase
import FirebaseRemoteConfig

protocol ListFeaturesProtocol {
    var listFeaturesData : PublishSubject<ListFeaturesApi>{get}
    func fetchListFeaturesData()
}

class ListFeaturesServices : ListFeaturesProtocol {
   
    
    private let remoteConfig = RemoteConfig.remoteConfig()
    var listFeaturesData: PublishSubject<ListFeaturesApi> = PublishSubject()
    var defaultListFeature : [String] = [
        "Isi AIGO",
        "Isi Pulsa",
        "Paket Suka-Suka",
        "Cek AIGO",
        "History",
        "Beli Paket",
        "Surprize",
        "Voucherku",
    ]
    func fetchListFeaturesData(){
        let defaults : [String : NSObject] = [
            "listFeatures" : [defaultListFeature] as NSArray
        ]
        remoteConfig.setDefaults(defaults)
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        self.remoteConfig.fetch(withExpirationDuration: 0) { status, error in
            if status == .success , error == nil {
                self.remoteConfig.activate { _, error in
                    guard error == nil else {
                        return
                    }
                    let value = self.remoteConfig.configValue(forKey: "listFeatures").dataValue
                    do {
//                        let res2 = try JSONDecoder().decode([String].self, from: value)
//                        print("dt::",res2)
                        let result = try JSONSerialization.jsonObject(with: value)
//                        self.listFeaturesCollectionView.dataListFeatures = result as? [String]
                     
                        let featureList = result as? [String]
                      
                        let featureModelData = ListFeaturesApi(listFeatures: featureList)
                        self.listFeaturesData.onNext(featureModelData)
                       
                    }catch {
                        print(error)
                    }
                }
            }
        }

    }
    
    
}


