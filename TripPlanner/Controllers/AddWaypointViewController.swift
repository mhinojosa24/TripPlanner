//
//  AddWaypointViewController.swift
//  TripPlanner
//
//  Created by Student Loaner 3 on 6/30/19.
//  Copyright © 2019 Student Loaner 3. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreData



class AddWayPointViewController: UIViewController, UISearchBarDelegate, LocateOnTheMap, GMSAutocompleteResultsViewControllerDelegate {
    
    
    
    //MARK: instantiating variables
    var mapView: GMSMapView!
//    var locationManager = CLLocationManager()
    var placesClient: GMSPlacesClient!
//    var likelyPlaces: [GMSPlace] = []
//    var selectedPlaces: GMSPlace?
    
    var resultsViewController: GMSAutocompleteResultsViewController?
//    var searchController: UISearchController?
    var resultView: UITextView?
    var resultsArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchBarButton)), animated: true)
        addMap()
//        resultsViewController = SearchResultsViewController()
        resultsViewController?.delegate = self
    }
    
    
    @objc func searchBarButton() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self

        self.present(searchController, animated: true, completion: nil)
    }
    
    func locateWithLongitude(lon: Double, andLatitude lat: Double, andTitle title: String) {
        DispatchQueue.main.async {
            let position = CLLocationCoordinate2DMake(lat, lon)
            let marker = GMSMarker(position: position)
        
            let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lon, zoom: 10)
            self.mapView.camera = camera
            marker.title = title
            marker.map = self.mapView
        }
    }
    
    

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let placeCient = GMSPlacesClient()
        placeCient.autocompleteQuery(searchText, bounds: nil, filter: nil) { (results, error) in

            self.resultsArray.removeAll()
            if results == nil {
                return
            }

            for result in results! {
                if let result = result as? GMSAutocompletePrediction {
                    self.resultsArray.append(result.attributedFullText.string)
                }
            }
            self.resultsViewController.reloadWith
        }
    }
    
    func addMap() {
        mapView = GMSMapView(frame: self.view.frame)
        self.view = mapView
    }
    
    func addSearchBar() {
        
    }
    
}

