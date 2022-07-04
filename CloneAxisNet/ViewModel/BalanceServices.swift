//
//  BalanceServices.swift
//  CloneAxisNet
//
//  Created by Batm on 20/06/22.
//

import Foundation
import RxSwift
import RxCocoa

protocol BalanceProtocol {
    var balanceData : PublishSubject<BalanceApi>{get}
    func fetchBalanceData()
}

class BalanceServices : BalanceProtocol {
    var balanceData: PublishSubject<BalanceApi> = PublishSubject()
    
    func fetchBalanceData() {
        let balanceApi = URL(string: "https://run.mocky.io/v3/3bd32236-f00d-44b7-ba08-2ea754e8ded0")
        
        let task = URLSession.shared.dataTask(with: balanceApi!) { data, response, error in
            
            if error != nil {
                // ------------- CodeReview - start ---------------
                // jangan dibuat force casting gini, kalo ternyata errornya gak bisa di force cast ke String, nanti dia crash
                print(error?.localizedDescription as! Error)
                // ------------- CodeReview - end ---------------
                return
            }
            if let safeDataBalance = data {
                do {
                    let res = try JSONDecoder().decode(BalanceApi.self, from: safeDataBalance)
                    self.balanceData.onNext(res)
                }catch {
                    print(error)
                }
            }
        }
        task.resume()

    }
    
    
}

