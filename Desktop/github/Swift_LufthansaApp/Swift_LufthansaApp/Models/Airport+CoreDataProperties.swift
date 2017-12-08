//
//  Airport+CoreDataProperties.swift
//  Swift_LufthansaApp
//
//  Created by Сергей Кохан on 08.12.2017.
//  Copyright © 2017 Siarhei Kokhan. All rights reserved.
//
//

import Foundation
import CoreData


extension Airport {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Airport> {
        return NSFetchRequest<Airport>(entityName: "CDAirport")
    }

    @NSManaged public var airportName: String?
    @NSManaged public var airportCode: String?
    @NSManaged public var countryCode: String?
    @NSManaged public var cityCode: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double

}
