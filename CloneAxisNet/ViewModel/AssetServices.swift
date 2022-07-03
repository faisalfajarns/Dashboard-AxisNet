//
//  AssetServices.swift
//  CloneAxisNet
//
//  Created by Batm on 16/06/22.
//

import Foundation
import RxCocoa
import RxSwift

protocol AssetServicesProtocol {
    var assetData : PublishSubject<AssetsUIApi>{get}
    func fetchAssetData()
}

class AssetServices : AssetServicesProtocol {
    var assetData: PublishSubject<AssetsUIApi> = PublishSubject()
    
    func fetchAssetData() {
        let assetApi = URL(string: "https://run.mocky.io/v3/a8e0ca71-f427-4987-b35c-360f22a3146b")
        
        let task = URLSession.shared.dataTask(with: assetApi!) { data, response, error in
            
            if error != nil {
                print(error?.localizedDescription as! Error)
                return
            }
            if let safeDataAsset = data {
                do {
                    let res = try JSONDecoder().decode(AssetsUIApi.self, from: safeDataAsset)
                    self.assetData.onNext(res)
                }catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    
}
