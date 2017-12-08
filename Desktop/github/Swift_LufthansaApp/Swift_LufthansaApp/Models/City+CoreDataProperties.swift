//
//  City+CoreDataProperties.swift
//  Swift_LufthansaApp
//
//  Created by Сергей Кохан on 08.12.2017.
//  Copyright © 2017 Siarhei Kokhan. All rights reserved.
//
//

import Foundation
import CoreData


extension City {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<City>(entityName: "CDCity")
    }

    @NSManaged public var cityName: String?
    @NSManaged public var cityCode: String?

}
