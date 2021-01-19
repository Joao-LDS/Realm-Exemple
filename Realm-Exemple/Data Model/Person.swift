//
//  Person.swift
//  Realm-Exemple
//
//  Created by João Luis Santos on 19/01/21.
//  Copyright © 2021 João Luis Santos. All rights reserved.
//

import Foundation
import RealmSwift

class Person: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var birthday: Date? = nil
    var height = RealmOptional<Float>()
    let smartphone = List<SmartPhone>()
}
