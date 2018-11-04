//
//  RealmConfig.swift
//  treads
//
//  Created by Andre Burgoyne on 2018-11-03.
//  Copyright © 2018 Andre Burgoyne. All rights reserved.
//

import Foundation
import RealmSwift

class RealmConfig {
    static var runDataConfig: Realm.Configuration {
        let realmPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(REALM_RUN_CONFIG)
        let config = Realm.Configuration(
            fileURL: realmPath,
            schemaVersion: 0,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 0) {
                    //Nothing to do
                    //Realm will auto detect new properties and remove properties
                }
        })
        return config
    }
}
