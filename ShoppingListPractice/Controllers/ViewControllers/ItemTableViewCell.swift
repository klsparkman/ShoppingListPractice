//
//  ItemTableViewCell.swift
//  ShoppingListPractice
//
//  Created by Kelsey Sparkman on 3/30/21.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemCheckedButton: UIButton!
    
    // MARK: - Properties
    var item: Item? {
        didSet {
            if let item = item {
                self.itemLabel.text = item.name
            }
        }
    }
}
