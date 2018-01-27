//
//  Category.swift
//  TODOList
//
//  Created by Luis Isaac Maya Estrada on 25/01/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name = ""
    let items = List<Item>()// relacion 1 a muchos
}
