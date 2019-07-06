//
//  SearchResultsViewController.swift
//  TripPlanner
//
//  Created by Student Loaner 3 on 7/2/19.
//  Copyright © 2019 Student Loaner 3. All rights reserved.
//

import UIKit

protocol LocateOnTheMap{
    func locateWithLongitude(lon:Double, andLatitude lat:Double, andTitle title: String)
}

class SearchResultsViewController: UITableViewController {
    
    var searchResults: [String]!
    var delegate: LocateOnTheMap!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchResults = Array()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
}

