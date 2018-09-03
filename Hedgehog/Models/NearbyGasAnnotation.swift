//
//  NearbyGasAnnotation.swift
//  Hedgehog
//
//  Created by Cooper Stainbrook on 8/26/18.
//  Copyright © 2018 Cooper Stainbrook. All rights reserved.
//

import Foundation
import MapKit

class NearbyGasAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    let subtitle: String?
    var image: UIImage?
    
    
    init(station: String, gallonPrice: Double, coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.title = "\(station) \n$\(gallonPrice)/Regular"
        self.subtitle = "$\(gallonPrice)/Regular"
        self.image = UIImage(contentsOfFile: "Gas_Pump")
        super.init()
    }
    
}
