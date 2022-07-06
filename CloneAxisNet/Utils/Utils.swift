//
//  Utils.swift
//  CloneAxisNet
//
//  Created by Batm on 04/07/22.
//

import Foundation
import UIKit




extension String  {
    func formatCurrency() -> String{
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        let formatterBalance = formatter.string(from: Double(self)! as NSNumber)
        guard let safeformatterbalance = formatterBalance else {
            return "Error"
        }
        let convString = String(describing: safeformatterbalance)
        
      return convString
    }
    
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = dateFormatter.date(from: self) else {
            return "error"
        }
        let newDateFormatter = DateFormatter()
        newDateFormatter.dateFormat = "dd MMM YYYY"
        let newStr = newDateFormatter.string(from: date)
        
        return newStr
    }
}

extension UIImageView {
    func setBgImage(url : String){
        let urlImage = URL(string: url)
        if let safeUrlImage = urlImage {
            let data = try? Data(contentsOf: safeUrlImage)
            if let safedata = data {
                self.image = UIImage(data: safedata) ?? UIImage()
            }

        }
    }
}
