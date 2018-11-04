//
//  Location.swift
//  treads
//
//  Created by Andre Burgoyne on 2018-11-03.
//  Copyright © 2018 Andre Burgoyne. All rights reserved.
//

import Foundation
import RealmSwift

class Location: Object {
    @objc dynamic public private(set) var latitude = 0.0
    @objc dynamic public private(set) var longitude = 0.0
    
    convenience init(latitude: Double, longitude: Double) {
        self.init()
        self.latitude = latitude
        self.longitude = longitude
    }
}
