//
//  Category.swift
//  Todoey
//
//  Created by Laila Guzzon Hussein Lailota on 08/04/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var colour: String = ""
    let items = List<Item>()
}
