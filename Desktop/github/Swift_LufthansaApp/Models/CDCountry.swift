//
//  CDCountry.swift
//  Swift_LufthansaApp
//
//  Created by Сергей Кохан on 06.12.17.
//  Copyright © 2017 Siarhei Kokhan. All rights reserved.
//

import Foundation
import CoreData

@objc(CDCountry) //возможно надо будет заменить на Country
class CDCountry: NSManagedObject {
    
    
  func  inititial(serverResponse responseObject: [String: Any]) {
        
        countryCode = responseObject["CountryCode"] as? String ?? ""
    
    if let names = responseObject["Names"] as? [String:Any] {
        if let name = names["Name"] as?  [String:Any] {
            if let countryName = name["$"] as? String {
                self.countryName = countryName
                }
            }
        }
    }
}

