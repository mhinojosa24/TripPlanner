//
//  TripsCoreData.swift
//  TripPlanner
//
//  Created by Student Loaner 3 on 6/30/19.
//  Copyright © 2019 Student Loaner 3. All rights reserved.
//

import UIKit
import CoreData

class TripCoreData {
    private let modelName: String
    
    
    init(modelName: String){
        self.modelName = modelName
    }
    static let managedContext: NSManagedObjectContext = {
       
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistanceContainer = appDelegate.persistentContainer
        let context = persistanceContainer.viewContext
        return context
    }()
    
    class func addTrip() -> Trip {
        let newTrip = NSEntityDescription.insertNewObject(forEntityName: "Trip", into: managedContext) as! Trip
        return newTrip
    }
    
    class func saveTrip() {
        do {
            try managedContext.save()
        } catch let error {
            print("Unable tovae \(error.localizedDescription)")
        }
    }
    
    class func deleteTrip(trip: NSManagedObject) {
        managedContext.delete(trip)
        saveTrip()
    }
    
    class func getTrips() -> [Trip] {
        do {
            let fetchRequests = NSFetchRequest<Trip>(entityName: "Trip")
            let results = try managedContext.fetch(fetchRequests)
            return results
        } catch let error {
            print("Unable to get any data \(error.localizedDescription)")
            return []
        }
    }
    
    
    
}

