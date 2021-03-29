//
//  Item.swift
//  ShoppingListPractice
//
//  Created by Kelsey Sparkman on 3/29/21.
//

import Foundation

class Item: Codable {
    let name: String
    var isChecked: Bool = false
    
    init(name: String, isChecked: Bool) {
        self.name = name
    }
}

extension Item: Equatable {
    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.name == rhs.name
    }
}
