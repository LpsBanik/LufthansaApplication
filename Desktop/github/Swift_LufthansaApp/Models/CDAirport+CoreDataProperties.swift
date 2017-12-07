//
//  CDAirport+CoreDataProperties.swift
//  Swift_LufthansaApp
//
//  Created by Сергей Кохан on 06.12.17.
//  Copyright © 2017 Siarhei Kokhan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension CDAirport {

    @NSManaged var airportCode: String?
    @NSManaged var airportName: String?
    @NSManaged var cityCode: String?
    @NSManaged var countryCode: String?
    @NSManaged var latitude: NSNumber?
    @NSManaged var longitude: NSNumber?

}
