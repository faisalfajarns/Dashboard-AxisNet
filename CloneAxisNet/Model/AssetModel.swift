//
//  AssetModel.swift
//  CloneAxisNet
//
//  Created by Batm on 16/06/22.
//

import Foundation

struct AssetsUIApi : Decodable{
    var ui : [Ui]
    var card : String?
}

struct Ui : Decodable {
    var name : String?
    var value : String?
}
