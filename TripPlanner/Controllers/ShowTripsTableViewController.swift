//
//  ViewController.swift
//  TripPlanner
//
//  Created by Student Loaner 3 on 6/26/19.
//  Copyright © 2019 Student Loaner 3. All rights reserved.
//

import UIKit
import CoreData

class ShowTripsTableViewController: UITableViewController {
    
    //MARK: instantiating properties
    
    var trip: Trip!
    var tripNames = [Trip]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tripNames = TripCoreData.getTrips()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    @IBAction func addPlannedTripsBTN(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add Trip", message: "Give this trip a name!", preferredStyle: .alert)
        
        alert.addTextField { (textfield) in
            textfield.placeholder = "Trip name"
        }
        
        let save = UIAlertAction(title: "Save", style: .default, handler: { [weak alert] (_) in
            guard let textField = alert?.textFields!.first?.text else { return }
            
            // save trip to core data
        
            let trip = TripCoreData.addTrip()
            trip.name = textField
            TripCoreData.saveTrip()
            self.tripNames = TripCoreData.getTrips()
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(save)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
   
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let tripVC = storyboard?.instantiateViewController(withIdentifier: "tripVC") as? TripWayPointsViewController {
            tripVC.tripName = tripNames[indexPath.row].name
            let navigationController = UINavigationController(rootViewController: tripVC)
            self.present(navigationController, animated: true, completion: nil)
        } 
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let currentTrip = tripNames[indexPath.row]
        cell.textLabel?.text = currentTrip.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let selectedTrip = tripNames[indexPath.row]
            TripCoreData.deleteTrip(trip: selectedTrip)
            tripNames.remove(at: indexPath.row)
        }
        
    }
}

