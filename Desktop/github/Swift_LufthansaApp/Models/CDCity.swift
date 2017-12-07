//
//  CDCity.swift
//  Swift_LufthansaApp
//
//  Created by Сергей Кохан on 06.12.17.
//  Copyright © 2017 Siarhei Kokhan. All rights reserved.
//

import Foundation
import CoreData

@objc(CDCity)
class CDCity: NSManagedObject {

    
    func  inititial(serverResponse responseObject: [String: Any]) {
        
        cityCode = responseObject["CityCode"] as? String ?? ""
        
        if let names = responseObject["Names"] as? [String:Any] {
            if let name = names["Name"] as?  [String:Any] {
                if let cityName = name["$"] as? String {
                    self.cityName = cityName
                }
            }
        }
    }
}