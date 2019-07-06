//
//  Trip+CoreDataProperties.swift
//  TripPlanner
//
//  Created by Student Loaner 3 on 6/30/19.
//  Copyright © 2019 Student Loaner 3. All rights reserved.
//
//

import Foundation
import CoreData


extension Trip {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trip> {
        return NSFetchRequest<Trip>(entityName: "Trip")
    }

    @NSManaged public var name: String?
    @NSManaged public var waypoints: NSMutableOrderedSet?

}

// MARK: Generated accessors for waypoints
extension Trip {

    @objc(insertObject:inWaypointsAtIndex:)
    @NSManaged public func insertIntoWaypoints(_ value: WayPoints, at idx: Int)

    @objc(removeObjectFromWaypointsAtIndex:)
    @NSManaged public func removeFromWaypoints(at idx: Int)

    @objc(insertWaypoints:atIndexes:)
    @NSManaged public func insertIntoWaypoints(_ values: [WayPoints], at indexes: NSIndexSet)

    @objc(removeWaypointsAtIndexes:)
    @NSManaged public func removeFromWaypoints(at indexes: NSIndexSet)

    @objc(replaceObjectInWaypointsAtIndex:withObject:)
    @NSManaged public func replaceWaypoints(at idx: Int, with value: WayPoints)

    @objc(replaceWaypointsAtIndexes:withWaypoints:)
    @NSManaged public func replaceWaypoints(at indexes: NSIndexSet, with values: [WayPoints])

    @objc(addWaypointsObject:)
    @NSManaged public func addToWaypoints(_ value: WayPoints)

    @objc(removeWaypointsObject:)
    @NSManaged public func removeFromWaypoints(_ value: WayPoints)

    @objc(addWaypoints:)
    @NSManaged public func addToWaypoints(_ values: NSMutableOrderedSet)

    @objc(removeWaypoints:)
    @NSManaged public func removeFromWaypoints(_ values: NSMutableOrderedSet)

}
