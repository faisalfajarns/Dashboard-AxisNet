//
//  RecommendedPackageServices.swift
//  CloneAxisNet
//
//  Created by Batm on 27/06/22.
//

import Foundation
import RxSwift
import RxCocoa

protocol RecommendedPackageProtocol {
    var recommendedPackageData : PublishSubject<RecommendedPackageApi>{get}
    func fetchRecommendedPackageData()
}

class RecommendedPackageServices : RecommendedPackageProtocol {

    var recommendedPackageData: PublishSubject<RecommendedPackageApi> = PublishSubject()

    
    func fetchRecommendedPackageData() {
        let recommendedPackageApi = URL(string: "https://run.mocky.io/v3/337a7069-3682-48d4-8f96-28b8ce29c8ee")
        
        let task = URLSession.shared.dataTask(with: recommendedPackageApi!) { data, response, error in
            
            if error != nil {
                print("error::",error?.localizedDescription as! Error)
                return
            }
            if let safeDataRecommendedPackage = data {
                do {
                    let res = try JSONDecoder().decode([RecommendedPackageApi].self, from: safeDataRecommendedPackage)
                            self.recommendedPackageData.onNext(res[0])
                }catch {
                    print(error)
                }
            }
       
        }
        task.resume()
    }
    
}
    
    

