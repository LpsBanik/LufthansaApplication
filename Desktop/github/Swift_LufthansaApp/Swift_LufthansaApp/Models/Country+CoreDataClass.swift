//
//  Country+CoreDataClass.swift
//  Swift_LufthansaApp
//
//  Created by Сергей Кохан on 08.12.2017.
//  Copyright © 2017 Siarhei Kokhan. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Country)
public class Country: NSManagedObject {

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
