//
//  LocationVC.swift
//  treads
//
//  Created by Andre Burgoyne on 2018-10-10.
//  Copyright © 2018 Andre Burgoyne. All rights reserved.
//

import UIKit
import MapKit

class LocationVC: UIViewController, MKMapViewDelegate {
    
    //variables
    var manager: CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CLLocationManager()
        manager?.desiredAccuracy = kCLLocationAccuracyBest
        manager?.activityType = .fitness
    }
    
    func checkLocationAuthStatus() {
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            manager?.requestWhenInUseAuthorization()
        }
    }
}
