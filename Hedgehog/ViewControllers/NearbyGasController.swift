//
//  NearbyGasController.swift
//  Hedgehog
//
//  Created by Cooper Stainbrook on 8/26/18.
//  Copyright © 2018 Cooper Stainbrook. All rights reserved.
//

import MapKit
import UIKit

class NearbyGasController: UIViewController {
    
    @IBOutlet weak var nearbyGasMapView: MKMapView!
    
    //Initial Map Coordinates
    let initialLocation = CLLocation(latitude: 39.7392, longitude: -104.9903)
    let regionRadius: CLLocationDistance = 10000
    
    //Gas Station Addresses
    let addresses = [("Shell", "1300 W Colfax Ave, Denver, CO 80204"), ("Phillips 66", "1234 Kalamath St, Denver CO 80204"), ("Conoco", "1107 Santa Fe Dr, Denver, CO 80204"), ("Conoco", "1690 Pearl St, Denver, CO 80203"), ("Conoco", "1000 E Colfax Ave, Denver, CO 80218"), ("Diamond Shamrock", "1001 Broadway, Denver, CO 80203")]
    
    override func viewDidLoad() {
       //center the initial location of the map.
       centerMapOnLocation(location: initialLocation, radius: regionRadius)
       
       //Add Gas Stations to map.
        for station in addresses {
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(station.1, completionHandler: { (placemarks, error) in
                if let placemarks = placemarks {
                    if let location = placemarks.first?.location {
                        let latitude = location.coordinate.latitude
                        let longitude = location.coordinate.longitude
                        let annotation = NearbyGasAnnotation(station: station.0, gallonPrice: 2.85, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
                        self.nearbyGasMapView.addAnnotation(annotation)
                    }
                }
                else {
                    return
                }
            })
        }



    }
    
    
    func centerMapOnLocation(location: CLLocation, radius: CLLocationDistance) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, radius, radius)
        nearbyGasMapView.setRegion(coordinateRegion, animated: true)
    }
    
}
