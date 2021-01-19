//
//  RealmStack.swift
//  Realm-Exemple
//
//  Created by João Luis Santos on 19/01/21.
//  Copyright © 2021 João Luis Santos. All rights reserved.
//

import Foundation
import RealmSwift

class RealmStack {
    static let shared = RealmStack()
    let realm = try! Realm()
    
    func save(person: Person, with smartphones: [SmartPhone]) {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        try! realm.write {
            realm.add(person)
            for smartphone in smartphones {
                person.smartphone.append(smartphone)
            }
        }
    }
    
    
}
