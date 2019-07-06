//
//  WayPoints+CoreDataProperties.swift
//  TripPlanner
//
//  Created by Student Loaner 3 on 6/30/19.
//  Copyright © 2019 Student Loaner 3. All rights reserved.
//
//

import Foundation
import CoreData


extension WayPoints {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WayPoints> {
        return NSFetchRequest<WayPoints>(entityName: "WayPoints")
    }

    @NSManaged public var lat: Float
    @NSManaged public var long: Float
    @NSManaged public var name: String?
    @NSManaged public var trip: Trip?

}
