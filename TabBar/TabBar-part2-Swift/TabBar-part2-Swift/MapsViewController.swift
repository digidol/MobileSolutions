//
//  MapsViewController.swift
//  TabBar-part1-Swift
//
//  Created by Neil Taylor on 10/03/2015.
//  Copyright (c) 2015 Aberystwyth University. All rights reserved.
//
// Some of this code is based on example 9.4 'Displaying Pins on a Map View' in
// iOS Swift Programming Cookbook, Vandad Nahavandipoor, O'Reilly

import UIKit
import MapKit

class MapsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    // The views have been created and we can start to interact with 
    // the UI for this view
    override func viewDidLoad() {
        super.viewDidLoad()
        showAnnotations()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Centre the map around the specified coordinate.
    func centreMap(coordinate: CLLocationCoordinate2D) {
        
        let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let coordinateRegion = MKCoordinateRegion(center: coordinate, span: coordinateSpan)
        
        mapView.setRegion(coordinateRegion, animated: true)
        
    }
    
    // Iterate over the list of venues and add an annotation 
    // for each one to the map. This uses the custom MapAnnotation 
    // class, which is also available in this project.
    func showAnnotations() {
        
        var coordinate: CLLocationCoordinate2D? = nil
        
        for (venueTitle, venue) in TalksData().venues {
            
            // Create a Core Location coordinate using the Venue data
            coordinate = CLLocationCoordinate2D(latitude: venue.latitude, longitude: venue.longitude)
            
            // Create an annotation (pin) that will be displayed on the map
            let annotation = MapAnnotation(coordinate: coordinate!, title: venue.title)
            
            // add the pin to the map
            mapView.addAnnotation(annotation)
            
        }
        
        // We only have a few coordinates, so we will just centre on 
        // last one that we looked at, providing there was at least one.
        if coordinate != nil {
           centreMap(coordinate!)
        }
    }
    
    // 
    // Handle the request to change the Map Type
    //
    @IBAction func mapTypeChanged(sender: UISegmentedControl) {
        
        
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            print("Error?")
        }
    }
    
}
