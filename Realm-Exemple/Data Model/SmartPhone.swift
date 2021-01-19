//
//  SmartPhone.swift
//  Realm-Exemple
//
//  Created by João Luis Santos on 19/01/21.
//  Copyright © 2021 João Luis Santos. All rights reserved.
//

import Foundation
import RealmSwift

class SmartPhone: Object {
    @objc dynamic var brand: String = ""
    @objc dynamic var model: String? = nil
}
