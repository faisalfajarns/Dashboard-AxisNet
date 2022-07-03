//
//  RecommendedPackageModel.swift
//  CloneAxisNet
//
//  Created by Batm on 27/06/22.
//

import Foundation

struct RecommendedPackageApi : Decodable {
    var group_id : String?
    var group_name : String?
    var sort : Int?
    var images : String?
    var categories : [Categories]
}

struct Categories : Decodable {
    var id : String?
    var name : String?
    var desc : String?
    var sort : Int?
    var packages : [Packages]
}

struct Packages : Decodable {
    var code : String?
    var name : String?
    var desc_disc : String?
    var price : Int?
    var price_disc : Int?
    var volume : String?
    var exp : String?
    var icon : String?
    var teaser : Bool?
    var product : Bool?
    var available : Int?
    var fake_stock : Int?
    var fake_stock_percent : Int?
    var fake_stock_plus : Bool?
}
