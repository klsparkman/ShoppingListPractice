//
//  ItemController.swift
//  ShoppingListPractice
//
//  Created by Kelsey Sparkman on 3/29/21.
//

import Foundation

class ItemController {
    
    // MARK: - Properties
    static var shared = ItemController()
    var items: [Item] = []
    
    // MARK: - CRUD
    func createItem(name: String) {
        let newItem = Item(name: name, isChecked: false)
        items.append(newItem)
        saveToPersistentStorage(items: items)
    }
    
    func deleteItem(item: Item) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
            saveToPersistentStorage(items: items)
        }
    }
    
    func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "ShoppingListPractice.json"
        let documentDirectory = urls[0]
        let documentsDirectoryURL = documentDirectory.appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    func saveToPersistentStorage(items: [Item]) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(items)
            try data.write(to: fileURL())
        } catch let error {
            print("There was an error saving to persistent storage: \(error)")
        }
    }
    func loadFromPersistence() {
        let jsonDecoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let decodedData = try jsonDecoder.decode([Item].self, from: data)
            self.items = decodedData
        } catch let error {
            print("\(error.localizedDescription) -> \(error)")
        }
    }
    

}
