//
//  TripWayPointsViewController.swift
//  TripPlanner
//
//  Created by Student Loaner 3 on 6/30/19.
//  Copyright © 2019 Student Loaner 3. All rights reserved.
//

import UIKit
import CoreData


class TripWayPointsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    //MARK: instantiating properties
    var tripWayPoints = [WayPoints]() {
        didSet {
            self.wayPointTableVC.reloadData()
        }
    }
    var wayPoint: WayPoints!
    public var tripName: String?
    @IBOutlet weak var wayPointTableVC: UITableView!
    @IBOutlet weak var titleTripLabel: UILabel!
    @IBOutlet weak var addWayPointBTN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        self.wayPointTableVC.delegate = self
        self.wayPointTableVC.dataSource = self
        self.wayPointTableVC.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.addWayPointBTN.addTarget(self, action: #selector(addWayPoint), for: .touchUpInside)
    }
    
    
    @objc func addWayPoint() {
        print("pressed")
        if let addWayPointVC = storyboard?.instantiateViewController(withIdentifier: "addWayPointVC") as? AddWayPointViewController {
            
            let navigationController = UINavigationController(rootViewController: addWayPointVC)
            self.present(navigationController, animated: true, completion: nil)
        }
    }
    
    func updateUI() {
        if let name = tripName {
            self.navigationItem.title = "My \(name) trip"
            self.titleTripLabel.text = name
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripWayPoints.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let selectedPlace = tripWayPoints[indexPath.row]
            TripCoreData.deleteTrip(trip: selectedPlace)
            tripWayPoints.remove(at: indexPath.row)
        }
    }
    
    
}
