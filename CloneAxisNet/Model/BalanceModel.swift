//
//  BalanceModel.swift
//  CloneAxisNet
//
//  Created by Batm on 20/06/22.
//

import Foundation

struct BalanceApi : Decodable {
    var status : String?
    var result : Result
}

struct Result : Decodable {
    var accounttype : String?
    var accountstate : String?
    var activestopdate : String?
    var suspendstopdate : String?
    var disablestopdate : String?
    var balance : String?
}


