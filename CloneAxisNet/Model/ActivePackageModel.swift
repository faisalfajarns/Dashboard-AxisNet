//
//  ActivePackageModel.swift
//  CloneAxisNet
//
//  Created by Batm on 21/06/22.
//

import Foundation

struct ActivePackageApi : Decodable{
    var status : String?
    var result : Results
}


struct Results : Decodable{
    var summary : Summary?
    var detail : [Detail]?
}

struct Summary : Decodable {
    var activePackage: Int?
    var isUnlimited : String?
    var usage : String?
    var percentUsage : Int?
    var remaining : String?
    var percentRemaining : Int?
    var total : String?
    var activeUntil : String?
    var sisaHari : String?
    var percentSisaHari : Int?
    var regPackage : String?
    var wordingInfoTotalQuota : String?
}

struct Detail : Decodable {
    var name :  String?
    var type : String?
    var icon : String?
    var price : String?
    var confirmDesc : String?
    var total : String?
    var remaining : String?
    var origin_quota : Int?
    var percentRemaining : Int?
    var usage : String?
    var percentUsage : Int?
    var progressColor : String?
    var benefitData : BenefitData
    var infoBenefit : InfoBenefit
}

struct BenefitData : Decodable {
    var activeUntil : String?
    var isUnlimited : String?
    var paymentMethod : String?
    var sisaHari : String?
    var percentSisaHari : String?
    var regPackage : String?
    var rata_rataHarian : String?
    var estimasiHabis : String?
    var wordingInfoExpired : String?
    var parsing_id : Int?
    var parsing_condition : String?
    var dataBar : [DataBar]
}

struct DataBar : Decodable {
    var packageName : String?
    var total : String?
    var remaining : String?
    var percentRemaining : Int?
    var usage : String?
    var percentUsage: Int?
    var dataBar_id : Int?
    var eligibleLocalShow : String?
    var wordingLocalQuota : String?
    var progressColor : String?
}

struct InfoBenefit : Decodable {
    var status: Bool
    var itemId : String?
    var bname : String?
    var category : String?
    var packages : String?
}
