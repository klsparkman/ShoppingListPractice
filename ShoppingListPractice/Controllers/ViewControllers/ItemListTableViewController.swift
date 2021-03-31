//
//  ItemListTableViewController.swift
//  ShoppingListPractice
//
//  Created by Kelsey Sparkman on 3/30/21.
//

import UIKit

class ItemListTableViewController: UITableViewController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func addButtonTapped(_ sender: Any) {
        addItemPopup()
        tableView.reloadData()
    }
    
    func addItemPopup() {
        let alert = UIAlertController(title: "Add Item", message: "", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addAction = UIAlertAction(title: "Add", style: .default) { (_) in
            print("Add button tapped")
        }
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        present(alert, animated: true, completion: nil)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ItemController.shared.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? ItemTableViewCell else {return UITableViewCell()}
        cell.item = ItemController.shared.items[indexPath.row]
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let selectedItem = ItemController.shared.items[indexPath.row]
            ItemController.shared.deleteItem(item: selectedItem)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}
