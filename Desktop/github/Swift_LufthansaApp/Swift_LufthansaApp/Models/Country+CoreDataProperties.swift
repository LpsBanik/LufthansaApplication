//
//  Country+CoreDataProperties.swift
//  Swift_LufthansaApp
//
//  Created by Сергей Кохан on 08.12.2017.
//  Copyright © 2017 Siarhei Kokhan. All rights reserved.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "CDCountry")
    }

    @NSManaged public var countryName: String?
    @NSManaged public var countryCode: String?

}
