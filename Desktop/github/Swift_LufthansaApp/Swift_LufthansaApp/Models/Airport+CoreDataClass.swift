//
//  Airport+CoreDataClass.swift
//  Swift_LufthansaApp
//
//  Created by Сергей Кохан on 08.12.2017.
//  Copyright © 2017 Siarhei Kokhan. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Airport)
public class Airport: NSManagedObject {

    func  inititial(serverResponse responseObject: [String: Any]) {
        
        airportCode = responseObject["airportCode"] as? String ?? ""
        
        if let names = responseObject["Names"] as? [String:Any] {
            if let name = names["Name"] as? [String:Any] {
                if let airportName = name["$"] as? String {
                    self.airportName = airportName
                }
            }
        }
        
        cityCode = responseObject["cityCode"] as? String ?? ""
        
        countryCode = responseObject["countryCode"] as? String ?? ""
        
        if let position = responseObject["Position"] as? [String:Any] {
            if let coordinate = position["Coordinate"] as? [String:Any] {
                if let latitude = coordinate["Latitude"] as? Double {
                    self.latitude = latitude
                }
            }
        }
        
        if let position = responseObject["Position"] as? [String:Any] {
            if let coordinate = position["Coordinate"] as? [String:Any] {
                if let longitude = coordinate["Longitude"] as? Double {
                    self.longitude = longitude
                }
            }
        }
    }
}
