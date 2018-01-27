//
//  Item.swift
//  TODOList
//
//  Created by Luis Isaac Maya Estrada on 25/01/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title = ""
    @objc dynamic var done = false
    @objc dynamic var dateCreated : Date?
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items") //relacion muchos a 1
}
