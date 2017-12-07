//
//  BaseDataManagers.swift
//  Swift_LufthansaApp
//
//  Created by Сергей Кохан on 06.12.17.
//  Copyright © 2017 Siarhei Kokhan. All rights reserved.
//

import CoreData
import Foundation
import UIKit
import ServerManager

class BaseDataManager: NSObject {

    private(set) var managedObjectContext: NSManagedObjectContext?
    private(set) var managedObjectModel: NSManagedObjectModel?
    private(set) var persistentStoreCoordinator: NSPersistentStoreCoordinator?
    
    class func shared() -> ASIdentifierManager {
        var manager: BaseDataManager? = nil
        var onceToken: Int
        if (onceToken == 0) {
           manager = BaseDataManager()
        }
        onceToken = 1
        return manager as? ASIdentifierManager ?? ASIdentifierManager()
    }
    
    func addObjects(object: NSObject) {
        //проверка - если этот объект является страной, то создаем страну с соответствующими ей свойствами- entity
        if (object is Country) {
            let country = object as? Country
            let countryCoreData = NSEntityDescription.insertNewObject(forEntityName: "CDCountry", into: managedObjectContext) as? CDCountry
            countryCoreData.countryName = country?.countryName
            countryCoreData.countryCode = country?.countryCode ?? ""
            print("COUNTRY = \(country?.countryName), CODE = \(country?.countryCode)")
            return
        }
        //проверка - если это город, то создаем город с соответствующими ему свойствами- entity
        if (object is City) {
            let city = object as? City
            let cityCoreData = NSEntityDescription.insertNewObject(forEntityName: "CDCity", into: managedObjectContext) as? CDCity
            cityCoreData.cityName = city?.cityName
            // добавляет имя города на вьюшку City
            cityCoreData.cityCode = city?.cityCode
            print("CITY = \(city?.cityName), CODE = \(city?.cityCode)")
            return
        }
        //проверка - если это аэропорт, то создаем его с соответствующими ему свойствами- entity
        if (object is Airport) {
            let airport = object as? Airport
            let airportCoreData = NSEntityDescription.insertNewObject(forEntityName: "CDAirport", into: managedObjectContext) as? CDAirport
            airportCoreData.airportName = airport?.airportName
            airportCoreData.airportCode = airport?.airportCode
            airportCoreData.countryCode = airport?.countryCode ?? ""
            airportCoreData.cityCode = airport?.cityCode
            airportCoreData.latitude = airport?.latitude
            airportCoreData.longitude = airport?.longitude
            print("AIRPORTS = \(airport?.airportName), CODE = \(airport?.airportCode), countryCode = \(airport?.countryCode), cityCode = \(airport?.cityCode), latitude =\(airport?.latitude), longitude = \(airport?.longitude)")
            return
        }
    }
    
    func insertCountries(withOffset offset: Int, count: Int, language lang: String) {
        
        ServerManager.shared().getCountriesWithOffset(
            offset,
            language: lang,
            limit: count,
            onSuccess: {(countries: [Any]) -> Void in
            var countriesArray = [AnyHashable]()
            countriesArray.append(contentsOf: countries)
            for obj: Country in countriesArray {
                print("\(obj.countryName)")
                self.add(contentsOf: obj as? [Any] ?? [Any]())
            }
            }, onFailure: {(error: Error?, statusCode: Int) -> Void in
                print("error = \(error?.localizedDescription) , code = \(Int(statusCode))")
        })
    }
    
    
}
