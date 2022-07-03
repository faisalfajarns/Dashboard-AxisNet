//
//  PackageActiveService.swift
//  CloneAxisNet
//
//  Created by Batm on 21/06/22.
//

import Foundation
import RxSwift
import RxCocoa

protocol ActivePackageProtocol {
    var activePackageData : PublishSubject<ActivePackageApi>{get}
    func fetchActivePackageData()
}

class ActivePackageServices : ActivePackageProtocol {

    
    var activePackageData: PublishSubject<ActivePackageApi> = PublishSubject()
    
    func fetchActivePackageData() {
        let activePackageApi = URL(string: "https://run.mocky.io/v3/368249a7-e5d1-44b7-8b31-5246549ed1c5")
        
        let task = URLSession.shared.dataTask(with: activePackageApi!) { data, response, error in
            
            if error != nil {
                print("error::",error?.localizedDescription as! Error)
                return
            }
            if let safeDataActivePackage = data {
                do {
                    let res = try JSONDecoder().decode(ActivePackageApi.self, from: safeDataActivePackage)
                    self.activePackageData.onNext(res)
                }catch {
                    print(error)
                }
            }
        }
        task.resume()

    }
    
}

