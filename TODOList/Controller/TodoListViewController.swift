//
//  ViewController.swift
//  TODOList
//
//  Created by Luis Isaac Maya Estrada on 10/01/18.
//  Copyright © 2018 Isaac. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
         let newItem = Item()
        newItem.title = "Ve por Paola"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem.title = "Despensa"
        itemArray.append(newItem)
        
        let newItem3 = Item()
        newItem.title = "Jugar Dark Souls"
        itemArray.append(newItem)
        
        
      //  if let items = defaults.array(forKey: "TodoListArray") as? [String]{
        //    itemArray = items
        //}
    
    }
    
    
    
    
    
/// MARK - tableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
        
        
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
    
    
    
    
    
    
/// MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
    tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    
    
    
    
    
    
    
// MARK - add new items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Agregar nueva Lista", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Agregar Lista", style: .default) { (action) in
            // lo que pasara cuando el usuario quiera agregar algo
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "crear  nueva lista"
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }


}

